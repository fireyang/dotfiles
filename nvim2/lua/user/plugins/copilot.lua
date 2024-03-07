-- return {
-- 	{
-- 		"zbirenbaum/copilot.lua",
-- 		enabled = true,
-- 		event = { "BufEnter" },
-- 		config = function()
-- 			require("copilot").setup({
-- 				suggestion = {
-- 					enabled = false,
-- 				},
-- 				panel = { enabled = false },
-- 				copilot_node_command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/20.3.1/bin/node", -- Node.js version
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"zbirenbaum/copilot-cmp",
-- 		enabled = false,
-- 		event = { "BufEnter" },
-- 		dependencies = { "zbirenbaum/copilot.lua" },
-- 		config = function()
-- 			require("copilot_cmp").setup()
-- 		end,
-- 	},
-- }

return {
	"github/copilot.vim",
	event = { "BufEnter" },
	enabled = true,
}
