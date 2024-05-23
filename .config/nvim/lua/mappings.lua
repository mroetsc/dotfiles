require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LazyGit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Tmux Navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { noremap = true, silent = true })

-- Window Splits
vim.api.nvim_set_keymap('n', '|', '<cmd> vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\', '<cmd> split<CR>', { noremap = true, silent = true })

-- Smart Splits Navigation
vim.api.nvim_set_keymap('n', '<M-Left>', ":lua require('smart-splits').move_cursor_left()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ":lua require('smart-splits').move_cursor_down()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Down>', ":lua require('smart-splits').move_cursor_up()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Right>', ":lua require('smart-splits').move_cursor_right()<CR>", { noremap = true, silent = true })

-- Smart Splits Resize
vim.api.nvim_set_keymap('n', '<C-Up>', ":lua require('smart-splits').resize_up()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ":lua require('smart-splits').resize_down()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ":lua require('smart-splits').resize_left()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ":lua require('smart-splits').resize_right()<CR>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
