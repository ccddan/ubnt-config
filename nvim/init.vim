function! InitializeCoc()
  call coc#util#install()
  call coc#util#install_extensions([
  \ 'coc-ultisnips',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets'
  \ ])
endfunction


call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> InitializeCoc()}}
Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Requires:
"   - sudo apt install fd-find
"   - env vars: https://github.com/junegunn/fzf#respecting-gitignore

" Rust extra tools
  Plug 'neovim/nvim-lspconfig'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'rust-lang/rust.vim'
  " Debugging
  "Plug 'nvim-lua/plenary.nvim'
  "Plug 'mfussenegger/nvim-dap'

" TypeScript support
Plug 'jose-elias-alvarez/typescript.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'


" Colored brackets, parenthesis, etc
Plug 'frazrepo/vim-rainbow'

" Auto parenthesis, brackets, quotes, etc
Plug 'jiangmiao/auto-pairs'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Show guide for indentations
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'


" Working with buffers
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"" Code Folding
Plug 'anuvyklack/pretty-fold.nvim'
call plug#end()

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add cursor relative line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard+=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set scrolloff=5           " keep at least five lines next/above cursor
set splitright
set splitbelow
set foldmethod=syntax     " Use folding format depending on the language
nnoremap <leader>v :e $MYVIMRC<CR>


" color schemes
if (has("termguicolors"))
  set termguicolors
  endif
  syntax enable
" colorscheme evening
colorscheme dracula
" open new split panes to right and below



" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jj <Esc>
:inoremap jk <Esc>
:inoremap kk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Tootle NERDTree Panel
:nnoremap tt :NERDTreeToggle<CR>
" :inoremap tt :NERDTreeToggle<CR>
:vnoremap tt :NERDTreeToggle<CR>


" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"let g:UltiSnipsExpandTrigger="<"tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" fzf
nnoremap <C-p> :Files<Cr>


" Rust tools
lua << EOF
require('rust-tools').setup({})
EOF

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0


"" gitsigns
lua << EOF
require('gitsigns').setup({})
EOF

"" TypeScript
lua << EOF
require('typescript').setup({})
EOF

"" Show guides for indentations
"" 'lukas-reineke/indent-
lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true,
    -- show_current_context_start = true,
}
EOF



"" Code Folding 
lua << EOF
require('pretty-fold').setup({})
EOF

" Plugin frazrepo/vim-rainbow
let g:rainbow_active = 1



if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" fzf.vim mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Automatically select first option in autocomplete popup
" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode.
"inoremap <expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ pumvisible() ? coc#_select_confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <C-k>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ pumvisible() ? coc#_select_confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

"inoremap <silent><expr> <Cr>
      "\ pumvisible() ? coc#pum#confirm() :
      "\ CheckBackspace() ? "\<CR>" :
      "\ coc#refresh()

"inoremap <silent><expr> <Tab>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ?
      "\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<Tab>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"let g:coc_snippet_next = '<tab>'


" Barbar: 'jiangmiao/auto-pairs'

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
"nnoremap <silent>    <A-p> <Cmd>BufferPin<CR> "" conflicst with autopairs
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
"nnoremap <silent> <C-p>    <Cmd>BufferPick<CR> "" this keys combination
"conflicts with FZF
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>


" Copy/Past from/to system clipboard
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

""" WSL Only """
" clipboard with win32yank.exe
" in ~/bin/win32yank.exe
" https://github.com/equalsraf/win32yank/releases
let g:clipboard = {
  \   'name': 'win32yank-wsl',
  \   'copy': {
  \      '+': 'win32yank.exe -i --crlf',
  \      '*': 'win32yank.exe -i --crlf',
  \    },
  \   'paste': {
  \      '+': 'win32yank.exe -o --lf',
  \      '*': 'win32yank.exe -o --lf',
  \   },
  \   'cache_enabled': 0,
  \ }


