#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME}"

link_file() {
  local source_path="$1"
  local target_path="$2"
  ln -sfn "$source_path" "$target_path"
}

mkdir -p "$HOME_DIR/.zsh/configs" "$HOME_DIR/.zsh/completion" "$HOME_DIR/.zsh/functions"
mkdir -p "$HOME_DIR/.config"

link_file "$DOTFILES_DIR/aliases" "$HOME_DIR/.aliases"
link_file "$DOTFILES_DIR/.tool-versions" "$HOME_DIR/.tool-versions"
link_file "$DOTFILES_DIR/gitconfig" "$HOME_DIR/.gitconfig"
link_file "$DOTFILES_DIR/tmux.conf" "$HOME_DIR/.tmux.conf"
link_file "$DOTFILES_DIR/starship.toml" "$HOME_DIR/.config/starship.toml"
link_file "$DOTFILES_DIR/zlogin" "$HOME_DIR/.zlogin"
link_file "$DOTFILES_DIR/zprofile" "$HOME_DIR/.zprofile"
link_file "$DOTFILES_DIR/zshenv" "$HOME_DIR/.zshenv"
link_file "$DOTFILES_DIR/zshrc" "$HOME_DIR/.zshrc"

link_file "$DOTFILES_DIR/zsh/configs/ai-tools.zsh" "$HOME_DIR/.zsh/configs/ai-tools.zsh"
link_file "$DOTFILES_DIR/zsh/configs/color.zsh" "$HOME_DIR/.zsh/configs/color.zsh"
link_file "$DOTFILES_DIR/zsh/configs/completion.zsh" "$HOME_DIR/.zsh/configs/completion.zsh"
link_file "$DOTFILES_DIR/zsh/configs/editor.zsh" "$HOME_DIR/.zsh/configs/editor.zsh"
link_file "$DOTFILES_DIR/zsh/configs/history.zsh" "$HOME_DIR/.zsh/configs/history.zsh"
link_file "$DOTFILES_DIR/zsh/configs/keybindings.zsh" "$HOME_DIR/.zsh/configs/keybindings.zsh"
link_file "$DOTFILES_DIR/zsh/configs/options.zsh" "$HOME_DIR/.zsh/configs/options.zsh"
link_file "$DOTFILES_DIR/zsh/configs/path.zsh" "$HOME_DIR/.zsh/configs/path.zsh"
link_file "$DOTFILES_DIR/zsh/configs/prompt.zsh" "$HOME_DIR/.zsh/configs/prompt.zsh"
link_file "$DOTFILES_DIR/zsh/configs/tools.zsh" "$HOME_DIR/.zsh/configs/tools.zsh"
link_file "$DOTFILES_DIR/zsh/configs/tmux.zsh" "$HOME_DIR/.zsh/configs/tmux.zsh"

link_file "$DOTFILES_DIR/zsh/functions/_git_delete_branch" "$HOME_DIR/.zsh/functions/_git_delete_branch"
link_file "$DOTFILES_DIR/zsh/functions/change-extension" "$HOME_DIR/.zsh/functions/change-extension"
link_file "$DOTFILES_DIR/zsh/functions/envup" "$HOME_DIR/.zsh/functions/envup"
link_file "$DOTFILES_DIR/zsh/functions/g" "$HOME_DIR/.zsh/functions/g"
link_file "$DOTFILES_DIR/zsh/functions/mcd" "$HOME_DIR/.zsh/functions/mcd"

for completion in "$DOTFILES_DIR"/zsh/completion/*; do
  [ -e "$completion" ] || continue
  link_file "$completion" "$HOME_DIR/.zsh/completion/$(basename "$completion")"
done

printf 'Linked dotfiles from %s\n' "$DOTFILES_DIR"
