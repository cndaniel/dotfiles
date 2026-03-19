if command -v brew >/dev/null 2>&1; then
  fpath=(~/.zsh/completion "$(brew --prefix)/share/zsh/site-functions" $fpath)
else
  fpath=(~/.zsh/completion $fpath)
fi

autoload -U compinit
compinit
