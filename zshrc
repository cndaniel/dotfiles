# --- fpath repair (must run before any config autoloads colors/compinit/etc) ---
# Homebrew zsh exports FPATH (export -T FPATH fpath), so it leaks into long-lived
# daemons. A tmux server outlives `brew upgrade zsh`: it keeps re-injecting the
# FPATH it captured at start into every new pane. Once the upgrade deletes the old
# Cellar/<version>/functions dir, that inherited FPATH points at nothing and the
# new zsh finds no bundled functions — every autoload dies ("compinit / colors /
# add-zsh-hook: function definition file not found"). Re-anchor on THIS zsh's own
# functions dir up front. (N) drops missing paths; -U dedupes the inherited mess.
typeset -U fpath
fpath=(
  /opt/homebrew/share/zsh/functions(N)      # Homebrew: symlinked to current version
  /usr/share/zsh/${ZSH_VERSION}/functions(N) # Apple system zsh fallback
  /usr/local/share/zsh/functions(N)          # Intel Homebrew fallback
  $fpath
)

for function_file in ~/.zsh/functions/*(N-.); do
  source "$function_file"
done

for config_file in ~/.zsh/configs/*(N-.); do
  source "$config_file"
done

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# JDK 17 for Android / Gradle (added for android-marketgrep)
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Added by Claudepot — third-party route wrappers on PATH
export PATH="$HOME/.claudepot/bin:$PATH"

# >>> otty shell integration >>>
# Added by Otty — toggle in Settings > Shell > Shell Integration.
# Inert unless launched by Otty (it sets $OTTY_SHELL_INTEGRATION).
if [ -n "$OTTY_SHELL_INTEGRATION" ] && [ -r "$OTTY_SHELL_INTEGRATION/otty-integration.zsh" ]; then
  . "$OTTY_SHELL_INTEGRATION/otty-integration.zsh"
fi
# <<< otty shell integration <<<

# zoxide — initialized dead-last, after the configs/* loop AND the Otty integration
# above. Its doctor warns whenever another tool registers a chpwd hook after it, so
# this must be the final hook-registering line of the whole startup. Don't add any
# chpwd-based tool (mise/direnv/etc.) below this.
if command -v zoxide >/dev/null 2>&1; then
  # replace cd with zoxide: `cd <partial>` jumps to a frecent match; `cdi` to pick
  eval "$(zoxide init zsh --cmd cd)"
fi
