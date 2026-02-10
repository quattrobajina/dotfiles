# My Dotfiles

These are my personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/).

## Overview

This repository contains cross-platform configurations for my personal development environment:

- **Shell (zsh):** Pure prompt, `zsh-autosuggestions`, `zsh-completions`, history, aliases, and `fzf` integration (Linux/macOS).
- **Shell (bash):** Alternative shell configuration with templates for cross-platform compatibility.
- **Shell (PowerShell):** PowerShell Core (7+) configuration with `posh-git`, `PSReadLine`, `oh-my-posh`, and `zoxide` integration (Windows).
- **Editor (Neovim):** Lua-based configuration following the AstroNvim template.
- **Tmux:** Vi-style keybindings, mouse support, and a customized status bar (Linux/macOS).
- **Git:** Local machine-specific config and a comprehensive global ignore file.
- **Lazygit & WaveTerm:** Terminal UI for git and a modern terminal emulator with AI features.
- **Additional Tools:** Automated installation scripts for `btop`, `eza`, fonts, `fzf`, and Neovim.

External dependencies (zsh plugins, themes) are declared in `.chezmoiexternal.toml` and cloned automatically on Unix-like systems. Platform-specific files are managed via `.chezmoiignore`.

## Repository structure

**Top-level files:**
- `.chezmoiexternal.toml` – External dependencies (zsh plugins, themes) to clone on Unix-like systems.
- `.chezmoiignore` – Platform-specific exclusions (e.g., tmux/zsh on Windows, bash on macOS).
- `dot_bashrc.tmpl`, `dot_bash_logout`, `dot_profile` – Bash shell configuration.
- `dot_zshenv` – Zsh environment setup with XDG Base Directory compliance.
- `run_onchange_install-*.sh.tmpl` – Installation scripts for btop, eza, fonts, fzf, and Neovim (Unix-like systems).

**Documents/:**
- `PowerShell/Microsoft.PowerShell_profile.ps1` – PowerShell Core (7+) profile.
- `WindowsPowerShell/Microsoft.PowerShell_profile.ps1` – Windows PowerShell 5.x profile.

**dot_config/:**
- `nvim/` – Neovim configuration (AstroNvim template-based, Lua).
- `tmux/` – Tmux configuration with vi-mode and custom status bar.
- `git/` – Git config template and global ignore patterns.
- `lazygit/` – Lazygit TUI configuration.
- `waveterm/` – WaveTerm terminal emulator settings.
- `zsh/` – Zsh-specific RC files and profile templates.

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

## Platform-specific behavior

- **Windows:** Uses PowerShell profiles. Zsh, tmux, and shell scripts are excluded.
- **macOS:** Uses zsh and excluding bash/PowerShell configurations.
- **Linux:** Full Unix tooling with zsh, tmux, and all shell scripts.

The `.chezmoiignore` file automatically manages these exclusions based on your operating system.
