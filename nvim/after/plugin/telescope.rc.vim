if !exists('g:loaded_telescope') | finish | endif

" nnoremap <silent> <leader>1 <cmd>Telescope find_files<cr>
" nnoremap <silent> <leader>2 <cmd>Telescope buffers<cr>
" nnoremap <silent> <leader>3 <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
-- local actions = require('telescope.actions')
-- Global remapping
-- require('telescope').setup{}

EOF

