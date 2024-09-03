" Neovim configuration file
"
" include the vim (og) configs.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
if filereadable(expand("~/.vimrc"))
    source ~/.vimrc
elseif filereadable(expand("~/.vim/vimrc"))
    source ~/.vim/vimrc
endif

if has('nvim')
lua << EOF
	require('utils')
	require("bufferline").setup{}
	require("terminal").setup()
	require("term_options")
	require("tree-sitter")
local key_mapper = require('utils').key_mapper
-- A custom function that closes the current buffer, checks if it's the last buffer, and if so, closes the window.
key_mapper('n', '<C-q>', '<cmd>lua require("utils").close_buffer()<CR>')
EOF
endif

