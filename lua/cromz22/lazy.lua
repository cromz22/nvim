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
		}
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
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
		build = ":TSUpdate"
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

	-- snippet
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
	},

	-- language server
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- copilot
	{
		"github/copilot.vim"
	}
})
