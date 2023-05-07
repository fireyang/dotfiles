local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mason_ok, mason_config = pcall(require, "mason-lspconfig")
if not mason_ok then
	return
end

local servers = {
	-- "sumneko_lua",
	"lua_ls",
	"rust_analyzer",
	"tsserver",
	"gopls",
	"volar",
	"tailwindcss",
	"yamlls",
	"eslint",
	"ruff_lsp",
	--"clangd",
}

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_config.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		-- opts = vim.tbl_deep_extend("force", conf_opts, opts)
		-- keep use left opts
		opts = vim.tbl_deep_extend("keep", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		--"prettierd", -- ts/js formatter
		"stylua", -- lua formatter
		-- "eslint_d", -- ts/js linter
		"eslint", -- ts/js linter
		"gofumpt",
		"goimports",
		"rustfmt",
		"clang-format",
		-- "eslint-lsp",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
