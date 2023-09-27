local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

telescope.load_extension("project")
telescope.load_extension("frecency")

require("telescope").setup({
	extensions = {
		project = {
			base_dirs = {
				"~/.config/nvim",
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
	},
})

vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", telescope.extensions.frecency.frecency, { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>fw",
	"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
	{ noremap = true, silent = true }
)
