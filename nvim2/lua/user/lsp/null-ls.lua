local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
--local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.lsp.buf.format({ timeout_ms = 2000 })
--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
	debug = true,
	sources = {
		--formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.rustfmt,
		formatting.gofumpt,
		formatting.goimports,
		-- diagnostics.eslint_d,
		-- formatting.eslint_d,
		-- diagnostics.eslint,
		-- formatting.eslint,
		-- formatting.prettierd,
		formatting.clang_format,
		-- diagnostics.flake8
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					--vim.lsp.buf.formatting_sync()
					-- vim.notify("formatting: " .. client.name, vim.log.levels.WARN)
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
