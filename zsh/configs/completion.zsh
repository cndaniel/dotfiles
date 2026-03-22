if command -v brew >/dev/null 2>&1; then
  fpath=(~/.zsh/completions ~/.zsh/completion "$(brew --prefix)/share/zsh/site-functions" $fpath)
else
  fpath=(~/.zsh/completions ~/.zsh/completion $fpath)
fi

zmodload zsh/complist

autoload -U compinit
compinit

setopt auto_menu complete_in_word always_to_end

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

bindkey '^I' menu-complete
bindkey '^[[Z' reverse-menu-complete
