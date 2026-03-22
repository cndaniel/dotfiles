if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export BUN_INSTALL="$HOME/.bun"
export GOPATH="$HOME/go"

typeset -U path
path=(
  "$HOME/.local/bin"
  "$BUN_INSTALL/bin"
  "$HOME/.asdf/shims"
  "$HOME/go/bin"
  "$HOME/.bin"
  "$HOME/.cargo/bin"
  /opt/homebrew/sbin
  $path
)
path=(${path:#$HOME/.rvm/bin})
path=(${path:#$HOME/.rvm/gems/*/bin})
path=(${path:#$HOME/.rvm/rubies/*/bin})
path=(${path:#/usr/local/Cellar/asdf/*/libexec/bin})

[[ -f ~/.zprofile.private ]] && source ~/.zprofile.private
