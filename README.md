# Daniel's Dotfiles

Single-repo macOS dotfiles for zsh, git, tmux, and daily CLI tools.

## Goals

- One Git repo, no separate `dotfiles-local` layer.
- Fast migration to a new Mac with minimal manual steps.
- Safe defaults for AI CLIs, tmux, Homebrew, and `asdf`.
- Optional private overrides without committing secrets.

## Layout

- `zprofile` sets login-shell PATH and Homebrew environment.
- `zshrc` loads shell modules from `zsh/configs` and aliases from `aliases`.
- `tmux.conf` contains the active tmux setup directly.
- `gitconfig` keeps shared Git behavior and includes `~/.gitconfig.local` for private identity.
- `.tool-versions` pins shared runtime versions for `asdf`.
- `Brewfile` lists the core CLI packages to install on a fresh machine.

## Install

```bash
git clone <your-github-dotfiles-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then reload the shell:

```bash
exec zsh -l
```

## New Mac Quickstart

On a fresh Mac, run these in order:

```bash
xcode-select --install
```

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
git clone git@github.com:cndaniel/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
brew bundle --file ~/dotfiles/Brewfile
exec zsh -l
asdf install
```

Create private files as needed:

```bash
cp ~/dotfiles/gitconfig.local.example ~/.gitconfig.local
cp ~/dotfiles/zshrc.private.example ~/.zshrc.private
cp ~/dotfiles/zprofile.private.example ~/.zprofile.private
cp ~/dotfiles/aliases.private.example ~/.aliases.private
cp ~/dotfiles/tmux.conf.private.example ~/.tmux.conf.private
```

Verify the setup:

```bash
zsh -ic 'node -v; pnpm -v; ruby -v; tmux -V'
brew doctor
```

## Fresh Mac Setup

Install the base toolchain first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/dotfiles/Brewfile
```

Optional private files:

- `~/.gitconfig.local`
- `~/.zprofile.private`
- `~/.zshrc.private`
- `~/.aliases.private`
- `~/.tmux.conf.private`
- `~/.zshenv.private`

Template files are included in the repo:

- `gitconfig.local.example`
- `aliases.private.example`
- `zprofile.private.example`
- `zshrc.private.example`
- `tmux.conf.private.example`

Use `gitconfig.local.example` as a starting point for `~/.gitconfig.local`.

## Notes

- `asdf` is the primary version manager for language runtimes.
- `starship` is the preferred prompt, with a built-in fallback prompt when unavailable.
- `tmux` auto-attach is enabled for interactive terminals except Warp, VS Code, and JetBrains terminals.
- AI CLI commands are unified under `ai`, with shortcuts for `opencode`, `amp`, `claude`, and `codex`.
