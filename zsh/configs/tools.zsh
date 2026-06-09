export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fzf: Tokyo Night colors + file/dir previews on Ctrl-T and Alt-C
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
--color=fg:#a9b1d6,bg:-1,hl:#7aa2f7,fg+:#c0caf5,bg+:#283457,hl+:#7dcfff \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#bb9af7,marker:#9ece6a,spinner:#bb9af7,header:#565f89"
if command -v bat >/dev/null 2>&1; then
  export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || eza --tree --level=2 --color=always {} 2>/dev/null'"
fi
if command -v eza >/dev/null 2>&1; then
  export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons=auto --color=always {}'"
fi

# pretty, syntax-highlighted man pages
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="sh -c 'col -bx | bat --language man --style=plain'"
  export MANROFFOPT="-c"
fi

# mise: fast runtime version manager (reads .tool-versions)
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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

# zoxide must be initialized LAST: its doctor warns ("initialize zoxide right at
# the end…") whenever another tool registers a chpwd hook after it. Keep this the
# final hook-registering line — don't add mise/direnv/anything chpwd-based below.
if command -v zoxide >/dev/null 2>&1; then
  # replace cd with zoxide: `cd <partial>` jumps to a frecent match; `cdi` to pick
  eval "$(zoxide init zsh --cmd cd)"
fi
