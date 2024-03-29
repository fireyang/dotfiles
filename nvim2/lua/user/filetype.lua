-- 配置mdx
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

local is_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not is_ok then
	return
end
vim.treesitter.language.register("markdown", { "mdx" })

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = { "Jenkinsfile*" },
-- 	callback = function(_ev)
-- 		vim.api.nvim_command("setfiletype groovy")
-- 	end,
-- })
vim.cmd([[
au! BufNewFile,BufRead Jenkinsfile* set ft=groovy
au! BufNewFile,BufRead Dockerfile* set ft=dockerfile
au! BufNewFile,BufRead .env* set ft=sh
au! BufNewFile,BufRead *.pc set ft=pc
]])
-- autocmd BufNewFile,BufRead *.ini setfiletype dosini
--
--
vim.filetype.add({
	extension = {
		sdp = "sdp",
	},
})
