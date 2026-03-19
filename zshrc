for function_file in ~/.zsh/functions/*(N-.); do
  source "$function_file"
done

for config_file in ~/.zsh/configs/*(N-.); do
  source "$config_file"
done

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/daniel/.lmstudio/bin"
# End of LM Studio CLI section

