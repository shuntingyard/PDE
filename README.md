# Code Shunting Nvim

My Neovim PDE for software engineering and administration. It was designed to run on small platforms (e.g. a Raspberry Pi 3B) and is extensible with optional, but preconfigured plugins like `Treesitter`, `nvim-telescope`, `rust-tools.nvim` and more.

## Installation

### Linux

### Windows

## Requirements

- Better always use the latest stable Neovim version.
- Run `:checkhealth`.
- Make sure to have dependencies for `Mason` installed.

## What's New?

initial

## Directory Structure

### lua/builtin

Contains the core configuration which should hardly change.

### lua/optional

Contains dependencies and configurations for plugins to be activated on demand. See available plugins [here](lua/optional/available/).

### lua/yourdir

Is not tracked by Git, and contains:

- directory `./enabled` for user-created softlinks to activate optional plugins, and
- directory `./lsp` with template-based configuration files for Language Servers and `null-ls`.

### .templates

Stuff to copy to `lua/yourdir/lsp/` and adapt for specific purposes.

## Planned

- [ ] Configure and test optional `DAP` plugins.
- [ ] Make `mbbill/undotree` available (as an option).
- [ ] Write a plugin for formatting/highlighting embedded `SQL` (at least from Python and Rust).
- [ ] Possibly configure and test a Language Server for `prolog`.
- [ ] Possibly configure and test support for `TLA+`.
- [ ] What does it take (looking at `Mason`) to use this PDE on NixOS?

## Vim Links

[Why should I learn nvim?](https://ofirgall.github.io/learn-nvim/)

https://www.freecodecamp.org/news/vim-language-and-motions-explained/

https://blog.elvessousa.com.br/en/post/vim-part-3
