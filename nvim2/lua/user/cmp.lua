local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	completion = {
		-- completeopt = "menu,menuone,noinsert",
		completeopt = "menu",
		autocomplete = true,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
	},
	--    cmp.mapping.preset.insert({
	-- 	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
	-- 	["<C-e>"] = cmp.mapping.abort(),
	-- 	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- }),
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		-- Kind icons
	-- 		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	-- 		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	-- 		vim_item.menu = ({
	-- 			nvim_lsp = "[LSP]",
	-- 			luasnip = "[Snippet]",
	-- 			buffer = "[Buffer]",
	-- 			path = "[Path]",
	-- 		})[entry.source.name]
	-- 		return vim_item
	-- 	end,
	-- },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		-- documentation = {
		-- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- },
	},
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	}),
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
