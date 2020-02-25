set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'                                                       " altrnative snippet engine plugin with default snippets this supports contexts!
Plugin 'MicheleGiacomini/vim-snippets'                                          " snippet collections for various languages
Plugin 'ervandew/supertab'                                                      " Autocomplete
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'lervag/vimtex'                                                          " latex integration
"Plugin 'voldikss/vim-mma'
Plugin 'morhetz/gruvbox'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dbeniamine/todo.txt-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plugin 'godlygeek/tabular'
Plugin 'KeitaNakamura/tex-conceal.vim'
Plugin 'christoomey/vim-tmux-navigator'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" colorscheme
set background=dark
colorscheme gruvbox

" enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Spellcheck setup
setlocal spell spelllang=en_gb

inoremap <c-c> <ESC>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Set up deoplete to use vimtex
call deoplete#custom#var('omni', 'input_patterns', {
          \ 'tex': g:vimtex#re#deoplete
          \})

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" autopairs setup

au Filetype tex let g:AutoPairs['$']='$'
au Filetype markdown let g:AutoPairs['$']='$'
au Filetype tex let g:ycm_min_num_of_chars_for_completion = 99

" au Filetype vim unlet g:AutoPairs['"']

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" misc options, use :help 'option' to see documentation for 'option'
set autoindent 		            "keeps indentation on newline
set breakindent 	            "keeps indentation when line is wrapped
set expandtab		            "use soft tabs
set tabstop=4 	            	"tab width
set shiftwidth=4 	            "width for successive indentations
set shiftround                  "shifts by multiples of shiftwidth.
set backspace=indent,eol,start  "alters behavior of backspace in insert mode (can delete indents, end of lines and past start of insert mode
set complete-=i
set showmode                    "shows current mode
set smarttab                    "tab behaves as shift at start of line.
set incsearch                   "updates the search result while typing
set laststatus=2
set autoread                    "updates file if it has been changed outside of vim
set number                      "print line numbers
set relativenumber              "line numbers relative to cursor position
set ignorecase                  "search is not case sensitive
set smartcase                   "if pattern contains an uppercase letter turns off ignorecase

set mouse=a                     "sets mouse use to automatic.

set wrap
set linebreak
set nolist  " list disables linebreak

" vimtex setup

let g:vimtex_view_automatic = 1
let g:vimtex_view_method = 'skim'
set conceallevel=2
let g:tex_conceal='abdmg'
" Code folding setup
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let  g:vimtex_fold_types = {
        \ 'envs' : {
        \   'enabled' : 0,
        \ },
        \}
au FileType tex set fillchars=fold:\ 

"autoselect first auto correct entry
nnoremap <C-K> 1z=
inoremap <C-B> <Esc>[s1z=<C-O>a

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = 'https://www.ucl.ac.uk/~ucahmgi/files/soldark.css'

" sets default .tex file flavour to latex
let g:tex_flavor = "latex"

" enable callback functionality
let g:vimtex_compiler_progname = 'nvr'

" Syntax highlighting for mathematica files
let filetype_m = "mma"

" Text conceal for mathematica files
let g:mma_candy = 2
