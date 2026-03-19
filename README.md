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
