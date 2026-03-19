if [[ -o interactive && -t 0 && -t 1 && -z "${ZSH_EXECUTION_STRING:-}" ]]; then
  stty -ixon 2>/dev/null

  bindkey -v
  bindkey "^F" vi-cmd-mode
  bindkey "^A" beginning-of-line
  bindkey "^E" end-of-line
  bindkey "^K" kill-line
  bindkey "^R" history-incremental-search-backward
  bindkey "^P" history-search-backward
  bindkey "^Y" accept-and-hold
  bindkey "^N" insert-last-word
  bindkey "^Q" push-line-or-edit
  bindkey -s "^T" "^[Isudo ^[A"
fi
