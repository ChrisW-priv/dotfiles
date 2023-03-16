set nocompatible
set wildmenu

set number relativenumber 
set scrolloff=10
set nowrap
set hlsearch
set noswapfile

set splitright
set splitbelow
noremap <C-w>v <Esc>:vsplit<CR>
noremap <C-w>h <Esc>:split<CR>

set hidden
nnoremap t[ :tabp<CR>
nnoremap t] :tabn<CR>
nnoremap b[ :bprevious<CR>
nnoremap b] :bnext<CR>

syntax off
"" default colorschceme when only defaults are available 
"colorscheme murphy
colorscheme gruvbox
set bg=dark

" map kj to esc (capslock doesn't work for me :-( )
imap kj <Esc>

" leader definition here (space)
let mapleader=" "

" open the project directory
nmap <leader>pv :Ex<CR>

" compatibility with basic non vim editor shortcuts:
nnoremap <C-n> <Esc>:tabnew<CR>i
inoremap <C-s> <Esc>:w<CR>i
inoremap <C-a> <Esc>ggvG<CR>i
inoremap <C-z> <Esc>:u<CR>i
inoremap <C-c> <Esc>"+y<CR>i
inoremap <C-v> <Esc>"+p<CR>i

" clipboard with the outside
noremap <Leader>y "+y
noremap <Leader>p "+p

" make the indent 3 spaces wide
set smartindent
set tabstop=4 noexpandtab
set shiftwidth=4

" execute python, javascript after f9
autocmd FileType python map <buffer> <F9> <Esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <F9> <Esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType matlab map <buffer> <F9> <Esc>:w<CR>:exec '!matlab -batch' expand('%:t:r')<CR>
autocmd FileType markdown map <buffer> <F9> <Esc>:w<CR>:exec '!python3 -m grip -b' shellescape(@%, 1)<CR>
" explenation, in order: escape to normalmode, save file, execute `python3 [name of file]`

" add option to move blocks of code with shift-arrow
nmap <S-j> :m .+1<CR>==
nmap <S-k> :m .-2<CR>==
imap <S-Down> <Esc>:m .+1<CR>==gi
imap <S-Up> <Esc>:m .-2<CR>==gi
vmap <S-j> :m '>+1<CR>gv=gv
vmap <S-k> :m '<-2<CR>gv=gv

" match the parenthesis like {[( or quotes "'`
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<space> {  }<Left><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>

" if want to create the function body its more convinient to have it autocomplete to 
inoremap {<CR> {<CR>}<CR><Esc>kO

" allow tab to be used in normal mode and enter insert 
nnoremap <Tab> i<Tab>

" center the cursor after moving half a page
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" add plugins
call plug#begin('~/.vim/plugged')

" Add vim surround plugin 
Plug 'tpope/vim-surround'

call plug#end()

