local ok, treesitter = pcall(require, "nvim-treesitter.parsers")
if not ok then
	return
end
local parser_config = treesitter.get_parser_configs()

parser_config.sdp = {
	install_info = {
		url = "~/work/tree-sitter-sdp",
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "main", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "sdp", -- if filetype does not match the parser name
}

-- vim.treesitter.language.register('sdp', 'tars')
