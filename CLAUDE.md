# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built with Lazy.nvim plugin manager. The setup includes LSP support, markdown editing capabilities, file management, and a custom diary system for daily notes.

## Key Commands

### Plugin Management
- Lazy.nvim automatically installs and manages plugins
- Plugin updates are checked automatically via `checker = { enabled = true }`
- Plugin lock file: `lazy-lock.json`

### Configuration Management
- Main config: `init.lua`
- Reload config: Use the `reload.lua` module's `reload_nvim()` function
- Open config: `:OpenVimrc` custom command

### Daily Notes System
- `<leader>tdn` - Open today's diary note (creates directory structure automatically)
- `<leader>tp` - Push diary changes to git (auto-commit with "update" message)
- `<leader>tff` - Find text files using Telescope
- Diary directory: `~/projects/Texts/daily-notes/YYYY/MM/YYYY-MM-DD.md`

### File Operations
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Switch buffer (Telescope)
- `<C-n>` - Toggle nvim-tree file explorer
- `<C-p>` - Next tab
- `<C-n>` - Previous tab

## Architecture

### Plugin Organization
- `lua/plugins/init.lua` - Main plugin aggregator using `vim.tbl_flatten`
- `lua/plugins/lsp.lua` - LSP configuration (nvim-lspconfig, nvim-cmp, LuaSnip)
- `lua/plugins/ui.lua` - UI plugins (Telescope, which-key)
- `lua/plugins/markdown.lua` - Markdown editing tools (vim-markdown, markdown-preview, table-mode, toc)
- `lua/plugins/nvim-tree-setting.lua` - File explorer configuration

### Custom Modules
- `lua/diary.lua` - Custom diary system with git integration
- `lua/keymaps.lua` - Additional keymaps (currently empty)
- `lua/reload.lua` - Configuration reloading utilities

### Configuration Structure
- Leader key: `<space>`
- Tab width: 2 spaces (4 for Python files)
- Lazy loading enabled for performance
- 24-bit color support enabled

### LSP Setup
- Python support via Pyright
- Completion with nvim-cmp
- Tab/Shift-Tab navigation in completion menu
- Enter to confirm completion

The configuration is designed for markdown-heavy workflows with integrated git-based note management.