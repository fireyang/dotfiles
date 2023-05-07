vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

local is_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not is_ok then
	return
end
local ft_to_parser = parsers.filetype_to_parsername
ft_to_parser.mdx = "markdown"
