" QGIS Documentation Project Configuration
" Source the Lua config for full functionality
if has('nvim')
  lua dofile('.nvim.lua')
endif

" Basic settings for RST/Sphinx development
set expandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3
set textwidth=79
set colorcolumn=80

" RST file settings
autocmd FileType rst setlocal spell spelllang=en_us
autocmd FileType rst setlocal foldmethod=expr

" Recognize .rst files
autocmd BufRead,BufNewFile *.rst set filetype=rst
