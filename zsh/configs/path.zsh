typeset -U path
path=("$HOME/.bin" "$HOME/go/bin" $path)

if command -v git >/dev/null 2>&1; then
  _safe_repo_bin() {
    local root
    root="$(git rev-parse --show-toplevel 2>/dev/null)" || return 0
    path=("${path[@]:#${root}/bin}")

    if [ -d "$root/.git/safe" ] && [ -d "$root/bin" ]; then
      path=("$root/bin" "${path[@]}")
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook chpwd _safe_repo_bin
  _safe_repo_bin
fi
