return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local formatters_by_ft = {
			lua = { "stylua" },
			sql = { { "sqlfmt", "sqlfluff" } },
			go = { "gofmt" },
			python = { "ruff_format" },
			xml = { "xmlformatter" },
			json = { "jq" },
			-- vue = { "eslint_d" },
			-- ts = { "eslint_d" },
			-- js = { "eslint_d" },
			-- php = { "php-cs-fixer" },
			-- vue = { "prettierd" },
		}
		local util = require("conform.util")
		conform.setup({
			-- log_level = vim.log.levels.DEBUG,
			formatters_by_ft = formatters_by_ft,
			format_on_save = function(bufnr)
				-- Disable autoformat on certain filetypes
				local ignore_filetypes = { "sql", "java" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				-- Disable autoformat for files in a certain path
				-- local bufname = vim.api.nvim_buf_get_name(bufnr)
				-- if bufname:match("/node_modules/") then
				-- 	return
				-- end
				-- print("format on save", vim.bo[bufnr].filetype)
				return { timeout_ms = 500, lsp_format = "fallback", async = false }
			end,
			formatters = {
				eslint = function(bufnr)
					return {
						command = util.from_node_modules("eslint"),
						-- args = { "--stdin", "--stdin-filename", "$FILENAME" },
						-- args = { "--format 'json'", "--fix", "$FILENAME" },
						args = {
							"--stdin",
							"--stdin-filename",
							"$FILENAME", -- This passes the current file path to eslint
							"--fix-dry-run", -- Fixes issues and outputs the result to stdout
						},
						require_cwd = true,
						stdin = true,
						cwd = util.root_file({
							-- "package.json",
							"eslint.config.js",
							"eslint.config.mjs",
							"eslint.config.cjs",
						}),
					}
				end,
			},
		})
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			local conform = require("conform")
			conform.format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true })
	end,
}
