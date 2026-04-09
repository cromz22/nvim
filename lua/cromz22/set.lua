vim.opt.number = true
vim.opt.virtualedit = "onemore"
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.softtabstop = -1
vim.opt.clipboard = "unnamedplus"

if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
    vim.g.clipboard = "osc52"
elseif vim.env.TMUX and vim.fn.executable("xclip") == 1 then
    vim.g.clipboard = {
        name = "xclip",
        copy = {
            ["+"] = "xclip -selection clipboard -in",
            ["*"] = "xclip -selection primary -in",
        },
        paste = {
            ["+"] = "xclip -selection clipboard -out",
            ["*"] = "xclip -selection primary -out",
        },
        cache_enabled = 0,
    }
end

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
