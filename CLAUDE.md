# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using Lazy.nvim. Focused on markdown-heavy workflows with a git-based daily note system and Japanese input (SKK).

## Code Style

- Indentation: 2 spaces (4 for Python files via FileType autocmd)
- No formatter configured — `stylua` is planned but not yet set up

## Plugin Architecture

Plugins are split by concern under `lua/plugins/`:
- `init.lua` — aggregator using `vim.tbl_flatten`; add new plugin files here
- `lsp.lua` — LSP + completion (nvim-lspconfig, nvim-cmp, LuaSnip)
- `ui.lua` — Telescope, which-key
- `markdown.lua` — vim-markdown, markdown-preview, table-mode, toc
- `nvim-tree-setting.lua` — file explorer
- `skkeleton.lua` — Japanese input method

To add a new plugin: create `lua/plugins/<name>.lua` returning a plugin spec table, then add it to the `require` list in `lua/plugins/init.lua`.

## LSP

Only Python (Pyright) is configured. Other languages have no LSP server setup.

## Environment Prerequisites

The following must exist for full functionality:
- `~/projects/Texts/daily-notes/` — diary note directory (external repo)
- `~/.skk/SKK-JISYO.L` — SKK Japanese input dictionary
- Node.js/Deno — required by `denops.vim` (used by skkeleton)
- npm — required by `markdown-preview.nvim` (built on first install)
- Pyright — required for Python LSP

## Known Gotchas

- **`<C-n>` conflict**: mapped to both nvim-tree toggle (`nvim-tree-setting.lua`) and `:tabprev` (`init.lua`). The actual behavior may be inconsistent.
- `lua/reload.lua` only reloads `diary` and `reload` modules — plugin changes require a full Neovim restart.
- Diary `push_diary()` hard-codes commit message as `"update"` and pushes to whatever remote is configured in `~/projects/Texts`.
