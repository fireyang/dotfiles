-- local mason_registry = require("mason-registry")
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
-- .. "/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
	init_options = {
		plugins = {
			--{
			--		name = "@vue/typescript-plugin",
			--		location = vue_language_server_path,
			--		languages = { "javascript", "typescript", "vue" },
			--	},
		},
	},
	filetypes = { "javascript", "typescript", "vue" },
})

-- vim.lsp.config("volar", {
--	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--	init_options = {
--		vue = {
--			hybridMode = false,
--		},
--	},
-- })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
