" Basics
set number
set backspace=2
set updatetime=500
set hlsearch

" Mapping shortcut keys
let mapleader = ","

nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-w> <C-w>w

set pastetoggle=<F3>

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Auto complete brackets
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap ' ''<Esc>i
"imap ,, <ESC>la

" fold code
set foldmethod=indent


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'

"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
"" Initialize plugin system
call plug#end()

let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"  Also make sure that the g:ycm_add_preview_to_completeopt option is set to 0
"  when set non preview
"set completeopt-=preview

let g:ycm_seed_identifiers_with_syntax = 1
"
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

"python with virtualenv support
"func! SetPythonBinaryPath(aPath)
"    let g:ycm_python_interpreter_path = a:aPath
"endfunc
"py3 << EOF
"import string
"import os
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/python')
"    vim.command(":call SetPythonBinaryPath('" + activate_this + "')")
"EOF
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/global_extra_conf.py'


colorscheme dracula
"autocmd ColorScheme dracula winheight Normal ctermbg=256
let g:dracula_bold = 1
let g:dracula_colorterm = 1
set t_Co=256


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'


" Syntastic Coniguration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" Error symbols
let g:syntastic_enable_highlighting = 1
highlight SyntasticErrorSign ctermfg=red
highlight SyntasticStyleErrorSign ctermfg=yellow
highlight SyntasticWarningSign ctermfg=red
highlight SyntasticStyleWarningSign ctermfg=yellow
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"
let g:syntastic_cursor_column = 1

nnoremap e] :lnext<CR>
nnoremap e[ :lprevious<CR>
nnoremap eo :Error<CR>
nnoremap ec :lclose<CR>
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1


map <F8> :NERDTreeToggle<CR>
