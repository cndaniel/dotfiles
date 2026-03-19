if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  git_prompt_info() {
    local current_branch
    current_branch="$(git current-branch 2> /dev/null)"
    if [[ -n "$current_branch" ]]; then
      echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
    fi
  }

  setopt promptsubst
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
fi
