# My Dotfiles

These are my personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/).

## Overview

This repository contains configurations for my personal development environment:

- **Shell (zsh):** Pure prompt, `zsh-autosuggestions`, `zsh-completions`, history, aliases, and `fzf` integration.
- **Editor (Neovim):** Lua-based configuration following the AstroNvim template.
- **Tmux:** Vi-style keybindings, mouse support, and a customized status bar.
- **Git:** Local machine-specific config and a comprehensive global ignore file.
- **Lazygit & WaveTerm:** Terminal UI for git and a modern terminal emulator with AI features.

External dependencies (plugins, colorschemes, external tools) are declared in `.chezmoiexternal.toml` and cloned automatically upon setup.

## Repository structure

**Top-level files:**
- `.chezmoiexternal.toml` – External dependencies to clone/manage during `chezmoi apply`.
- `.chezmoiignore` – Files and directories to exclude from `chezmoi` management.
- `dot_bashrc.tmpl`, `dot_zshenv` – Shell initialization templates.
- `run_onchange_install-*.sh.tmpl` – Platform-specific installation scripts (btop, eza, fonts, fzf, neovim).

**dot_config/:**
- `nvim/` – Neovim configuration (AstroNvim template-based, Lua).
- `tmux/`, `git/`, `lazygit/`, `waveterm/`, `zsh/` – Configuration files for each tool.

## Installation

1. **Install chezmoi:**
   Follow the [official guide](https://www.chezmoi.io/install/).

2. **Initialize the repository:**
   ```sh
   chezmoi init <THIS_GITHUB_USERNAME>
   ```

3. **Preview changes:**
   ```sh
   chezmoi diff
   ```

4. **Apply configuration:**
   ```sh
   chezmoi apply
   ```

After applying, your shell, editor, and tools will be configured as defined in this repository.
