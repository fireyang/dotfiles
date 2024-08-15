return {
	{
		"jlanzarotta/bufexplorer",
		-- lazy = true,
		config = function()
			vim.keymap.set("n", "<leader>bv", ":BufExplorer<CR>", { silent = true })
		end,
	},
}
