-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Leader (must be set before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------- Options --------------------

vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 50
vim.opt.showcmd = true
vim.opt.joinspaces = false
vim.opt.diffopt:append("vertical")
vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.spellfile = vim.fn.expand("$HOME/.vim-spell-en.utf-8.add")
vim.opt.complete:append("kspell")

-- POSIX shell for syntax
vim.g.is_posix = 1

-------------------- Keymaps --------------------

local map = vim.keymap.set

-- Switch between last two files
map("n", "<Leader><Leader>", "<C-^>", { desc = "Switch last two files" })

-- Window navigation: <C-h/j/k/l> is owned by vim-tmux-navigator, which also
-- jumps seamlessly into adjacent tmux panes at the window edges.

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-------------------- Autocmds --------------------

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) and vim.bo.filetype ~= "gitcommit" then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "css", "scss", "sass" },
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

-------------------- Plugins --------------------

require("lazy").setup("plugins", {
  change_detection = { notify = false },
})
