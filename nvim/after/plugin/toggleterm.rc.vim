" if !exists('g:toggleterm_terminal_mapping')
"   echom "Not loaded toggleterm.vim"
"   finish
" endif

lua <<EOF
require("toggleterm").setup{
open_mapping = [[<c-\>]],
size=20,
hide_numbers = true,
shell = vim.o.shell,
}
EOF
