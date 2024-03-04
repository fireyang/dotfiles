return {
	"szw/vim-maximizer",
	event = "BufWinEnter",
	keys = {
		{ "<leader>mt", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
