call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'terryma/vim-expand-region'
    Plug 'airblade/vim-gitgutter'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
call plug#end()

colorscheme Carbonfox

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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
