" vim: foldmethod=marker
set nocompatible
set background=dark

" dirs {{{
set undofile
set swapfile
set backup writebackup
set backupdir=$XDG_STATE_HOME/nvim/backup//
set runtimepath^=$XDG_DATA_HOME/vim
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath^=$XDG_CONFIG_HOME/vim/vimscript
set runtimepath^=$XDG_CONFIG_HOME/vim/vimscript/user
if ! has('nvim')
	set t_Co=256
	set viminfo     ='100,/50,:100
	set viminfofile =$XDG_STATE_HOME/vim/info
	set undodir     =$XDG_STATE_HOME/vim/undo/    | call mkdir(&undodir,   'p')
	set directory   =$XDG_STATE_HOME/vim/swap//   | call mkdir(&directory, 'p')
	set backupdir   =$XDG_STATE_HOME/vim/backup// | call mkdir(&backupdir, 'p')
	set viewdir     =$XDG_STATE_HOME/vim/view//   | call mkdir(&viewdir,   'p')
endif
" }}}

filetype plugin indent on
syntax on

" set {{{
set autochdir
set nowrap
set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set viewoptions-=options sessionoptions-=options
set shortmess+=AFI shortmess-=S
set completeopt=menu,menuone,noselect
set formatoptions-=cro
set clipboard=unnamed
set noshowmode
set hidden
set startofline
set switchbuf=vsplit
set updatetime=300 lazyredraw
set signcolumn=yes cursorline colorcolumn=79
set laststatus=2 showtabline=2
set conceallevel=3
set foldclose=
set foldopen+=insert,jump foldopen-=block
set foldmethod=syntax
set foldminlines=3 foldlevelstart=1
set shiftwidth=4 tabstop=4 softtabstop=4
set scrolloff=7 sidescrolloff=15
set number norelativenumber
set autoindent smartindent
set splitbelow splitright
set ignorecase smartcase infercase
set incsearch hlsearch
set wildmenu wildmode=full wildignorecase
set wildignore+=*.pyc,*pycache*
set matchpairs+=<:>
set list listchars=tab:\ \ ,trail:~
set fillchars=fold:\ 
" }}}

" let {{{
let mapleader = " "
let g:xml_syntax_folding = 1
let g:tex_flavor = "latex"
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
" }}}

" autocmd {{{
augroup vimrc
	autocmd!
	autocmd FileType     qf nnoremap <buffer> <CR> <CR>:lclose<CR>
	autocmd FileType     *  silent! loadview
	autocmd BufWrite     *  mkview
	" autocmd BufEnter     *  set formatoptions-=cro
	autocmd BufEnter     *  set noreadonly
	autocmd InsertEnter  *  set nolist
	autocmd InsertLeave  *  set list
	autocmd CmdlineLeave :  echo ''
	autocmd VimEnter     *  exec 'silent! !echo -ne "\e[2 q"' | redraw!
augroup END
" }}}

" neo {{{
if has('nvim')
	set laststatus=3
	lua require("user")
else
	runtime user/init.vim
endif
" }}}
