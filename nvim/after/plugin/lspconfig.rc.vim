if !exists('g:lspconfig')
    finish
endif

lua << EOF
    -- golang lsp
    lspconfig = require "lspconfig"
    lspconfig.gopls.setup{}


    function goimports(timeoutms)
        local context = { source = { organizeImports = true } }
        vim.validate { context = { context, "t", true } }

        local params = vim.lsp.util.make_range_params()
        params.context = context

        local method = "textDocument/codeAction"
        local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
        if resp and resp[1] then
            local result = resp[1].result
            if result and result[1] then
                local edit = result[1].edit
                vim.lsp.util.apply_workspace_edit(edit)
            end
        end

        -- vim.lsp.buf.formatting()
   end

EOF

" nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>D     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>R	   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
" 自动格式化
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)


" lua << EOF
"     -- python lsp
"     lspconfig = require'lspconfig'
"     lspconfig.pyright.setup{}
" EOF
