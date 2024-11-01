local util = require("lspconfig.util")
local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
	.. "/node_modules/@vue/language-server"
lspconfig.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = { "javascript", "typescript", "vue" },
})
lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local server_config = {}
		if server_name == "volar" or server_name == "ts_ls" then
			return
		end
		lspconfig[server_name].setup(server_config)
	end,
})
