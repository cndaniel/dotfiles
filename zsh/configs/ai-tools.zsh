: "${AI_DEFAULT_TOOL:=opencode}"

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

  command "$tool" "$@"
}
