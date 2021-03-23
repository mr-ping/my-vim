" Basics
set number
set backspace=2
set updatetime=500
set hlsearch
set cursorline      "高亮当前行背景
set smartcase       "只能匹配，即小写全匹配，大小写混合则严格匹配
set showmatch       "显示匹配的括号
"
" Clear search highlighting
map <Leader><Space> :nohl<CR>

" Open ture color
if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
endif

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
set foldenable
set foldmethod=indent


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py' }
"Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
"Plug 'jmcantrell/vim-virtualenv'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

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

"" YouCompleteMe config
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"  Also make sure that the g:ycm_add_preview_to_completeopt option is set to 0
"  when set non preview
"set completeopt-=preview
"
"let g:ycm_seed_identifiers_with_syntax = 1
""
"nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>r :YcmCompleter GoToReferences<CR>
"nnoremap <leader>t :YcmCompleter GetType<CR>

" jedi config
"let g:jedi#completions_enabled = 1
"let g:jedi#smart_auto_mappings = 1

"" Coc config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <leader>f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <leader>b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <leader>f coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <leader>b coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <leader>f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <leader>b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Enable airline integration
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = "\uf467 "
let airline#extensions#coc#warning_symbol = "\uf071 "

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
"let g:ycm_python_interpreter_path = ''
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/global_extra_conf.py'
"set statusline+=%{virtualenv#statusline()}


colorscheme dracula
"autocmd ColorScheme dracula winheight Normal ctermbg=256
let g:dracula_bold = 1
let g:dracula_colorterm = 1
set t_Co=256


let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='dracula'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1


"" Syntastic Coniguration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8']
"
"" Error symbols
"let g:syntastic_enable_highlighting = 1
"highlight SyntasticErrorSign ctermfg=red
"highlight SyntasticStyleErrorSign ctermfg=yellow
"highlight SyntasticWarningSign ctermfg=red
"highlight SyntasticStyleWarningSign ctermfg=yellow
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_style_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_style_warning_symbol = "⚠"
"let g:syntastic_cursor_column = 1
"
"nnoremap <C-e>n :lnext<CR>
"nnoremap <C-e>p :lprevious<CR>
"nnoremap <C-e>e :Error<CR>
"nnoremap <C-e>c :lclose<CR>
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_id_checkers = 1


map <F8> :NERDTreeToggle<CR>

" Disable auto tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'tmux'
