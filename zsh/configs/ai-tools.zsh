: "${AI_DEFAULT_TOOL:=opencode}"

claude() {
  local claude_path
  claude_path="$(whence -p claude 2>/dev/null || true)"

  if [ -n "$claude_path" ] && [ "$claude_path" != "$HOME/.local/share/mise/shims/claude" ]; then
    "$claude_path" "$@"
    return
  fi

  if command -v mise >/dev/null 2>&1 && mise which claude >/dev/null 2>&1; then
    "$(mise which claude)" "$@"
    return
  fi

  npx -y @anthropic-ai/claude-code "$@"
}

ai() {
  local tool

  if [[ $# -eq 0 || "$1" == -* ]]; then
    tool="$AI_DEFAULT_TOOL"
  else
    tool="$1"
    shift
  fi

  case "$tool" in
    opencode|amp|codex|claude)
      ;;
    *)
      echo "ai: unknown tool '$tool'" >&2
      echo "usage: ai [opencode|amp|codex|claude] [args...]" >&2
      return 2
      ;;
  esac

  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "ai: '$tool' is not installed or not in PATH" >&2
    return 127
  fi

  "$tool" "$@"
}
