local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- MODES --
-- "n" = normal_mode,
-- "i" = insert_mode,
-- "v" = visual_mode,
-- "x" = visual_block_mode,
-- "t" = term_mode,
-- "c" = command_mode,

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffer
keymap("n", "<leader>q", ":bdelete<CR>", opts)

-- NvimTree explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Use jk to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- Clear search highlights pressing <Esc> in normal mode
keymap('n', '<Esc>', ':nohlsearch<CR>', opts)

-- autoformat
-- vim.keymap.set({'n', 'i'}, '<C-f>', function() vim.lsp.buf.format() end)
