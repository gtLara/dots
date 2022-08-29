" Plugins

call plug#begin('~/.local/share/nvim/plugged')

" Nvim

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/lsp-colors.nvim'

" Telescope

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/sharkdp/fd'

" autocomplete

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Vim

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'

" Color themes

Plug 'arcticicestudio/nord-vim'

call plug#end()

" Basics

syntax on
set nocompatible
set termguicolors
set encoding=utf-8
set noerrorbells
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set smartindent
set nowrap
set smartcase
set noshowmode
set nobackup
set undodir=$HOME/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Requiring plugin configs -- standard namespace

lua require('init')


" leader remap

let mapleader = " "

" Make buf.definition open in new tab ... kinda hacky ..

nnoremap gd <cmd>tab split \| lua vim.lsp.buf.definition()<cr>


" Remaps
vnoremap Y "+Y
noremap ;j :tabprev<CR>
noremap ;k :tabnext<CR>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
inoremap ;{<CR> {<CR>}<ESC
inoremap ;{;<CR> {<CR>};<ESC>O
inoremap ,, <Esc>/<++><Enter>"_c4l
inoremap ;m <++>

" Macros

autocmd VimLeave * !sed -i 's/[ \t]*$//' %

" Não tá funcionando :((

augroup py
    autocmd!
    autocmd Filetype py map == :!python %<CR>
augroup end

augroup cplus
    autocmd!
    autocmd Filetype cpp inoremap ;l for(int i=0; i < <++> ; i++){<Esc>o<++><Esc>o}
    autocmd Filetype cpp inoremap ;dl for(int i=0; i < <++> ; i++){<Esc>ofor(int j=0; j < <++> ; j++){<Esc>o<++><Esc>o}<BS>}<Esc>o<BS>}
augroup end

" Latex stuff

augroup latex
    autocmd!
    autocmd VimEnter *.tex set spell spelllang=pt_br
    autocmd VimEnter *.tex set spellfile=$HOME/.config/nvim/spell/pt.utf-8.add
    autocmd Filetype tex map CM :! pdflatex %<CR>
    autocmd Filetype tex map BB :! bibtex $(echo % \| sed "s/.tex$//g") <CR>
    autocmd Filetype tex map S :! zathura $(echo % \| sed "s/tex$/pdf/g") & disown<CR>
    autocmd Filetype tex inoremap $ $$<left>
    autocmd Filetype tex inoremap ;env \begin{-<Esc>o<++><CR><BS>\end{-<Esc>vh
    autocmd Filetype tex inoremap ;doc \begin{document}<CR><++><CR>\end{document}
    autocmd Filetype tex inoremap ;fig \begin{figure}<CR>\centering<CR>\includegraphics{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR><BS>\end{figure}
    autocmd Filetype tex inoremap ;p \usepackage{}<left>
    autocmd Filetype tex inoremap ;eq \begin{equation}\label{<++>}<CR><++><CR>\end{equation}
    autocmd Filetype tex inoremap ;frac \frac{<++>}{<++>}
    autocmd Filetype tex inoremap ] \
    autocmd Filetype tex inoremap ;s \section{}<left>
    autocmd Filetype tex inoremap ;ss \subsection{}<left>
    autocmd Filetype tex inoremap ;sss \subsubsection{}<left>
    autocmd Filetype tex inoremap ;i \emph{}<left>
    autocmd Filetype tex inoremap ;b \textbf{}<left>
    autocmd Filetype tex inoremap ;r \ref{}<left>
    autocmd Filetype tex inoremap ;c \cite{}<left>
    autocmd Filetype tex vnoremap ;vr \color{red}<Esc>}kA\color{black}

augroup end

" Telescope remaps

" File stuff

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>

" LSP stuff

nnoremap <leader>ld <cmd>Telescope diagnostics bufnr=0<cr>

" Git stuff

nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gbc <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

" Very important stuff

nnoremap <leader>tp <cmd>Telescope planets<cr>

colorscheme nord
set background=dark

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ }

set t_Co=256
