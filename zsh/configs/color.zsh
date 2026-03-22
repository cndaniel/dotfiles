# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# LS_COLORS for GNU ls / zsh completion coloring
export LS_COLORS='di=1;34:ln=36:so=35:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:*.tar=1;31:*.gz=1;31:*.zip=1;31:*.jpg=35:*.png=35:*.mp4=35:*.mp3=36:*.pdf=33'

# eza colors — muted metadata, highlighted filenames
if command -v eza >/dev/null 2>&1; then
  export EZA_COLORS='da=38;5;243:uu=38;5;243:gu=38;5;243:sn=38;5;243:sb=38;5;243:ur=33:uw=31:ux=32:gr=33:gw=31:gx=32:tr=33:tw=31:tx=32'
fi

# use LS_COLORS for zsh completion highlighting
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
