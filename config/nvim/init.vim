"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/hanny/.neovim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/hanny/.neovim')
  call dein#begin('/home/hanny/.neovim')

  " Let dein manage dein
  " Required:
  call dein#add('/home/hanny/.neovim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('ajf/puppet-vim')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('tpope/vim-surround')
  call dein#add('craigemery/vim-autotag')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('GEverding/vim-hocon')
  call dein#add('dag/vim-fish')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-fugitive')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
set number 

nmap <leader>r :Tags<ENTER>
nmap <leader>e :BTags<ENTER>
nmap <leader>p :Files<ENTER>
nmap <leader>b :Buffers<ENTER>

let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:deoplete#enable_at_startup = 1

let g:autotagCtagsCmd = 'ag -l | ctags -L -'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

set ic

let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
let updatetime = 750

let g:NERDDefaultAlign = 'left' 

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
so /home/hanny/.neovim/repos/github.com/junegunn/fzf/plugin/fzf.vim
"End dein Scripts-------------------------

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype yaml setlocal ts=2 sts=0 sw=2 smarttab

" such that I can switch between unsaved buffers
set hidden

let g:airline#extensions#tabline#enabled = 1

" register with clipboard shortcut
map <leader>y "+
