
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<leader>ff", ":FZF<CR>", opts)
keymap("", "<leader>fb", ":Buffers<CR>", opts)
keymap("", "<leader>fg", ":Ag<CR>", opts)
