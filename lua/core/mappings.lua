vim.g.mapleader = " "

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Resize
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Neo-tree
--vim.keymap.set('n', '<c-e>', ':Neotree left toggle reveal<CR>')
vim.keymap.set('n', '<c-e>', ':Neotree float toggle reveal<CR>')
-- vim.keymap.set('n', '<c-o>', ':NvimTreeToggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Tabs
-- vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
-- vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
-- vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
-- vim.keymap.set("n", "<c-x>", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<Tab>", ":BufferNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>x", ":BufferClose<CR>")
vim.keymap.set("n", "<c-x>", ":BufferCloseAllButCurrent<CR>")

vim.keymap.set('n', 'gb', '<C-o>', { noremap = true, silent = true })
