return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
		config = function()
			-- require("ibl").setup()
			require("ibl").setup({
				scope = {
					enabled = false,
					show_start = false,
					show_end = false,
				},
			})
		end,
	},
}
