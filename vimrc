if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'terryma/vim-expand-region'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/goyo.vim'
call plug#end()

syntax enable
set relativenumber
set number
set expandtab
set shiftwidth=2
set tabstop=2
set updatetime=100
set laststatus=2
set backspace=indent,eol,start

" List certain whitespace characters
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

" Selections
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Do not jump to next occurence when using *
nnoremap * *``
