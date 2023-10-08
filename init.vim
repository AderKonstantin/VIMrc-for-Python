set number
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set encoding=UTF-8
set guifont=JetBrainMonoNL\ Nerd\ Font\ Regular:h13

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>
"See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$
"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]


" Plugins Here
call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" https://github.com/sbdchd/neoformat
Plug 'sbdchd/neoformat'
" NerdTree File Manager for NeoVim
Plug 'scrooloose/nerdtree'
" https://github.com/neomake/neomake/
Plug 'neomake/neomake'
" https://github.com/machakann/vim-highlightedyank/
Plug 'machakann/vim-highlightedyank'
" https://github.com/tmhedberg/SimpylFold
Plug 'tmhedberg/SimpylFold'


call plug#end()


" Settings Here for Plugins


" Settings for jedi-vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


"Settings for deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Settings for Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:Powerline_symbols='unicode'
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:airline#extensions#xkblayout#enabled = 0
let g:airline_theme='murmur'


" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


" NERDTree navigations
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Settings for Neomake
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

" Settings for Vim Highlight Plugin
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000





