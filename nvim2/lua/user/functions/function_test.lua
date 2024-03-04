print("load function ok")
vim.api.nvim_create_user_command("Test", function()
	local window_numbers = vim.api.nvim_tabpage_list_wins(0)
	print("Test command", window_numbers)
	for _, window_number in ipairs(window_numbers) do
		print("window_number", window_number)
		local buffer_number = vim.api.nvim_win_get_buf(window_number)
		local filetype = vim.bo[buffer_number].filetype
		--   local bufname = vim.api.nvim_buf_get_name(bufnr)
		print("bufname", filetype)
	end
end, { desc = "Test command" })

-- on bufwinentter and set nerdtree window size to 30
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		-- print("nerdtree 123")
-- 		local window_numbers = vim.api.nvim_tabpage_list_wins(0)
-- 		for _, window_number in ipairs(window_numbers) do
-- 			local buffer_number = vim.api.nvim_win_get_buf(window_number)
-- 			local filetype = vim.bo[buffer_number].filetype
-- 			if filetype == "NERD_tree" then
-- 				vim.api.nvim_win_set_width(window_number, 30)
-- 				break
-- 			end
-- 		end
-- 	end,
-- })
