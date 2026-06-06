for function_file in ~/.zsh/functions/*(N-.); do
  source "$function_file"
done

for config_file in ~/.zsh/configs/*(N-.); do
  source "$config_file"
done

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# JDK 17 for Android / Gradle (added for android-marketgrep)
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Added by Claudepot — third-party route wrappers on PATH
export PATH="$HOME/.claudepot/bin:$PATH"
