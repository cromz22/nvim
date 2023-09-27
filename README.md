# Neovim Settings

## Installation

- Clone this repository under `~/.config`.


## Personal settings
- General settings are written in [set.lua](./lua/cromz22/set.lua).
- Keymap settings (that doesn't involve plugins) are written in [keymap.lua](./lua/cromz22/keymap.lua)


## Packages

I use [lazy.nvim](https://github.com/folke/lazy.nvim) to manage plugins.
General package settings are written in [lazy.lua](./lua/cromz22/lazy.lua).
Detailed settings for each package are written in `after/plugin/*.lua`.

I use:

- [iceberg](https://github.com/cocopon/iceberg.vim) as colorscheme
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) for tree view of files and directories
- [telescope](https://github.com/nvim-telescope/telescope.nvim) as fuzzy finder
	- [ripgrep](https://github.com/BurntSushi/ripgrep) is required for full functionality
	- [telescope-project](https://github.com/nvim-telescope/telescope-project.nvim) to switch between projects
	- [telescope-frecency](https://github.com/nvim-telescope/telescope-frecency.nvim) for sorting files with "frecency"
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax parsing (which is helpful for semantic highlighting, selection, etc.)
- [Comment](https://github.com/numToStr/Comment.nvim) for commenting
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for bracket completion
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippets (See below for more info)
- [mason](https://github.com/williamboman/mason.nvim), [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for language server (See below for more info)
- [copilot](https://github.com/github/copilot.vim) to use Github Copilot
    - Subscription to copilot and node.js are needed

To add a package:

1. add configurations to `lua/cromz22/lazy.lua`
1. create `after/plugin/package-name-or-whatever.lua` and write detailed settings there if needed

Type `:Lazy home` to manage installed packages.


## Snippets

I use [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippets.

To add one:

1. create file `snippets/language-name.lua`
	- `language-name` has to match with filetype (`:set filetype?`)
1. add snippet there


## Language Server, Linter, Formatter

To use language servers, [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) is required.
To manage language servers, linter, and formatter, I use [mason](https://github.com/williamboman/mason.nvim).
[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) closes some gaps between the two.

I use:

- Python
	- language server (and linter): [pyright](https://github.com/microsoft/pyright)
	- formatter: [black](https://github.com/psf/black)

- Lua
	- language server (and linter): [lua-language-server](https://github.com/luals/lua-language-server)
	- formatter: [stylua](https://github.com/JohnnyMorganz/StyLua)

- Bash
	- language server: [bash-language-server](https://github.com/bash-lsp/bash-language-server) aka bashls

- Rust
	- language server: [rust_analyzer](https://github.com/rust-analyzer/rust-analyzer)

To add one:

1. install one through mason (`:Mason`)
1. add LSP server to `servers` variable in `after/plugin/lsp.lua`
1. add formatter to `FormatCode` function `after/plugin/lsp.lua`

cf.

- [available language servers for nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [available formatters for null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)

