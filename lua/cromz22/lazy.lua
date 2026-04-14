-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- color scheme
	{
		"cocopon/iceberg.vim",
		config = function()
			vim.cmd("colorscheme iceberg")
		end,
	},

	-- tree view
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>t", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "left",
					width = 30,
					mappings = {
						["s"] = "open_split",
						["v"] = "open_vsplit"
					},
				},
				filesystem = {
					filtered_items = {
						visible = true,
					}
				}
			})
		end,
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		-- switch between projects
		"nvim-telescope/telescope-project.nvim",
	},
	{
		-- sort by "frecency"
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "kkharji/sqlite.lua" },
	},

	-- highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local languages = {
				"bash",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			}

			ts.setup({})

			local ft_to_lang = {
				typescriptreact = "tsx",
				javascriptreact = "tsx",
			}
			local indent_langs = {
				css = true,
				html = true,
				javascript = true,
				lua = true,
				python = true,
				typescript = true,
				tsx = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo[args.buf].filetype
					local lang = ft_to_lang[ft] or ft

					if not vim.list_contains(languages, lang) then
						return
					end

					pcall(vim.treesitter.start, args.buf, lang)

					if indent_langs[lang] then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})

			local installed = ts.get_installed()
			local missing = vim.tbl_filter(function(lang)
				return not vim.list_contains(installed, lang)
			end, languages)

			if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
				vim.schedule(function()
					ts.install(missing, { summary = true })
				end)
			end
		end,
	},

	-- commenting
	{
		'numToStr/Comment.nvim',
		opts = {
			ignore = "^$", -- ignore empty lines
		},
		lazy = false,
	},

	-- auto bracket completion
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},

	-- language server
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

	-- copilot
	{
		"github/copilot.vim"
	}
})
