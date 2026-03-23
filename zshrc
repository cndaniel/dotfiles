for function_file in ~/.zsh/functions/*(N-.); do
  source "$function_file"
done

for config_file in ~/.zsh/configs/*(N-.); do
  source "$config_file"
done

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

