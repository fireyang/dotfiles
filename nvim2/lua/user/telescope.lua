local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

function live_grep_opts(opts)
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

local builtin = require("telescope.builtin")
local fs = function()
	builtin.live_grep(live_grep_opts({}))
end

--local buffers = builtin.buffers({ sort_mru = true })
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", fs, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<cr>")
--vim.keymap.set("n", "<leader>bv", builtin.buffers, { opts = { sort_mru = true } })
-- vim.keymap.set("n", "<leader>bv", "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<cr>")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
--vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {})
--vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep <cr>")
--vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep <cr>")
--vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")

telescope.setup({
	defaults = {
		--prompt_prefix = "",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { "dist" },
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["?"] = actions.which_key,
			},
		},
	},
	pickers = { sort_lastused = true },
	extensions = {},
})

--telescope.load_extension("fzy_native")
--telescope.load_extension("fzf")
