local opts = { noremap = true, silent = true }

--local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<Leader>ev", ":exec 'edit' '~/.config/nvim/init.lua'<cr>", opts)
-- NERDTree
keymap("i", "<leader>ee", "<esc>:MyNERDTreeToggle<CR>", opts)
keymap("n", "<leader>ee", ":MyNERDTreeToggle<CR>", opts)
keymap("i", "<leader>eo", "<esc>:NERDTreeFind<CR>", opts)
keymap("n", "<leader>eo", ":NERDTreeFind<CR>", opts)
-- keymap("i", "<leader>o", "<esc>:NERDTree %:p:h<CR>", opts)
-- keymap("n", "<leader>o", ":NERDTree %:p:h<CR>", opts)

-- NvimTree
--keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)
--keymap("i", "<leader>nt", "<ESC>:NvimTreeToggle<CR>", opts)

-- bufkill bd's: really do not mess with NERDTree buffer
keymap("n", "<backspace>", ":BD<cr>", opts)
keymap("n", "<s-backspace>", ":BD!<cr>", opts)

-- pannel move
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- VSplit
keymap("", "<leader>vs", ":vsplit<cr><C-l>", opts)
keymap("", "<leader>w", ":w<cr>", opts)
keymap("", "<leader>q", ":q<cr>", opts)

keymap("", "<leader>mc", "<Plug>MarkdownPreview", opts)
keymap("", "<leader>md", "<Plug>MarkdownPreviewStop", opts)
keymap("", "<leader>mp", "<Plug>MarkdownPreviewToggle", opts)

-- copy to System Clipboard
keymap("", "<leader>y", '"*y', opts)

-- window management
-- keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Comment
-- keymap("", "<leader>cc", function()
--   return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
-- end, opts)
-- local api = require("Comment.api")
-- vim.keymap.set("", "<leader>cc", api.toggle.linewise.current)
--
-- keymap("n", "<leader>bv", ":BufExplorer<CR>", opts)
