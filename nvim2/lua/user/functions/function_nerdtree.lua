vim.api.nvim_create_user_command("MyNERDTreeToggle", function()
	-- call command NERDTreeToggle
	vim.api.nvim_command("NERDTreeToggle")
	local window_numbers = vim.api.nvim_tabpage_list_wins(0)
	for _, window_number in ipairs(window_numbers) do
		local buffer_number = vim.api.nvim_win_get_buf(window_number)
		local filetype = vim.bo[buffer_number].filetype
		print("bufname", filetype)
		if filetype == "nerdtree" then
			vim.api.nvim_win_set_width(window_number, 30)
			break
		end
	end
end, {})
