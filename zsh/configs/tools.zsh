export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# asdf 0.18+ (Go rewrite): only needs shims in PATH (set in zprofile)
# and completions; source asdf.sh for env setup if available
if [ -s /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
elif [ -s /usr/local/opt/asdf/libexec/asdf.sh ]; then
  source /usr/local/opt/asdf/libexec/asdf.sh
fi

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if [[ -o interactive && -t 0 && -t 1 && -z "${ZSH_EXECUTION_STRING:-}" ]]; then
  if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
  fi

  if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh --disable-up-arrow)"
  fi

  if command -v brew >/dev/null 2>&1; then
    _brew_prefix="$(brew --prefix)"

    if [ -f "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
      source "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    fi

    if [ -f "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
      source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi

    unset _brew_prefix
  fi
fi

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
