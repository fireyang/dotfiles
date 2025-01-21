local function live_grep_opts(opts)
	local flags = tostring(vim.v.count)
	local additional_args = {}
	local prompt_title = "Live Grep"
	if flags:find("1") then
		prompt_title = prompt_title .. " [.*]"
	else
		table.insert(additional_args, "--fixed-strings")
	end
	if flags:find("2") then
		prompt_title = prompt_title .. " [w]"
		table.insert(additional_args, "--word-regexp")
	end
	if flags:find("3") then
		prompt_title = prompt_title .. " [Aa]"
		table.insert(additional_args, "--case-sensitive")
	end

	opts = opts or {}
	opts.additional_args = function()
		return additional_args
	end
	opts.prompt_title = prompt_title
	return opts
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		-- local trouble_telescope = require("trouble.providers.telescope")
		local trouble_telescope = require("trouble.sources.telescope")
		local builtin = require("telescope.builtin")
		local fs = function()
			builtin.live_grep(live_grep_opts({}))
		end

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				selection_caret = " ",
				file_ignore_patterns = { "dist" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						-- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						["<C-t>"] = trouble_telescope.open,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
					},
				},
			},
			pickers = { sort_lastused = true },
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fs", fs, {})
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<cr>")
		keymap.set("n", "<leader>fr", "<cmd>:Telescope resume<CR>")

		-- keymap.set("n", "<leader>bv", "<cmd>Telescope buffers sort_mru=true<cr>")
		keymap.set("n", "<leader>fh", builtin.help_tags, {})
		keymap.set("n", "<leader>fc", builtin.grep_string, {})
		-- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		-- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
