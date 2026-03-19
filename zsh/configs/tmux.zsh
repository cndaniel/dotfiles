_tmux_repo_root() {
  command -v git >/dev/null 2>&1 || return 1
  git rev-parse --show-toplevel 2>/dev/null || return 1
}

_tmux_session_name() {
  local root name
  root="$(_tmux_repo_root 2>/dev/null || print -r -- "$PWD")"
  name="${root:t}"

  if [[ "$root" == "$HOME" ]]; then
    name="home"
  fi

  name="${name//[^A-Za-z0-9._-]/-}"
  name="${name:l}"
  [[ -z "$name" ]] && name="shell"
  print -r -- "$name"
}

_tmux_ensure_session() {
  local name root
  name="$(_tmux_session_name)"
  root="$(_tmux_repo_root 2>/dev/null || print -r -- "$PWD")"

  tmux has-session -t "$name" 2>/dev/null && return 0
  tmux new-session -d -s "$name" -c "$root" -n main
  tmux select-window -t "$name:1"
}

_tmux_supported_terminal() {
  case "${TERM_PROGRAM:-}" in
    WarpTerminal|vscode)
      return 1
      ;;
  esac

  case "${TERMINAL_EMULATOR:-}" in
    JetBrains-JediTerm)
      return 1
      ;;
  esac

  return 0
}

_tmux_auto_attach() {
  [[ -o interactive ]] || return 0
  [[ -t 0 && -t 1 ]] || return 0
  [[ -z "${ZSH_EXECUTION_STRING:-}" ]] || return 0
  command -v tmux >/dev/null 2>&1 || return 0
  [[ -n "$TMUX" ]] && return 0
  [[ -n "$NO_AUTO_TMUX" ]] && return 0
  _tmux_supported_terminal || return 0

  _tmux_ensure_session || return 0
  tmux -2 attach -t "$(_tmux_session_name)" >/dev/null 2>&1 || true
}

_tmux_auto_attach
