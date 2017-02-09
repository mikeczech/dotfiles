call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/wikitopian/hardmode'
    Plug 'https://github.com/vim-syntastic/syntastic.git'
call plug#end()

syntax enable
set background=dark
colorscheme solarized
set number
set expandtab
set shiftwidth=2
set tabstop=2
set laststatus=2
set cursorline
set backspace=indent,eol,start

" List certain whitespace characters
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

" Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Enable HardMode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call EasyMode()

