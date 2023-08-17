local setup, copilot = pcall(require, "copilot")
if not setup then
	return
end

vim.cmd([[highlight CopilotSuggesstion guifg=#00ff00 ctermfg=8]])

vim.cmd([[
                        let g:copilot_filetypes = {
                              \ '*': v:true,
                              \ }
]])
