return {
	{
		"mistricky/codesnap.nvim",
		lazy = true,
		enable = false,
		build = "make",
		config = function()
			require("codesnap").setup({
				mac_window_bar = true, -- (Optional) MacOS style title bar switch
				opacity = true, -- (Optional) The code snap has some opacity by default, set it to false for 100% opacity
				watermark = "FireYang", -- (Optional) you can custom your own watermark, but if you don't like it, just set it to ""
				preview_title = "fireyang codesnap", -- (Optional) preview page title
				editor_font_family = "CaskaydiaCove Nerd Font", -- (Optional) preview code font family
				watermark_font_family = "Pacifico", -- (Optional) watermark font family
			})
			vim.keymap.set("v", "<leader>cn", ":CodeSnap<CR>", { silent = true })
		end,
	},
}
