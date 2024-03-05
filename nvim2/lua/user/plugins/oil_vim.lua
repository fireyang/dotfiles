-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "oil",
--   callback = function()
--     vim.opt_local.colorcolumn = ""
--   end,
-- })
return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				-- defalult open oil.
				-- default_file_explorer = true,
			})
		end,
	},
}
