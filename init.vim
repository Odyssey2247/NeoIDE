"vim settings
source $HOME/.config/nvim/general/settings.vim

"vim mapping
source $HOME/.config/nvim/general/mappings.vim


function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'}) "plugin manager

  " Additional plugins here.
  call minpac#add('vim-jp/syntax-vim-ex') "vim syntax
  call minpac#add('tyru/open-browser.vim') "open in browser
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'}) "coc for lsp
"  call minpac#add( 'junegunn/fzf', { 'do': { -> fzf#install() } }  )
"  call minpac#add('junegunn/fzf.vim')
  call minpac#add('ryanoasis/vim-devicons') "vim devicons
"  call minpac#add('dracula/vim')
  call minpac#add('preservim/nerdtree') "doc https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt
  call minpac#add('vim-airline/vim-airline') "bar status
"  call minpac#add('vim-airline/vim-airline-themes') 
"  call minpac#add('hzchirs/vim-material') "vim theme
"  call minpac#add('jalvesaq/vimcmdline') "vim run line code  https://github.com/jalvesaq/vimcmdline
"  call minpac#add('sbdchd/vim-run') run code
  call minpac#add('xianzhon/vim-code-runner') "run code https://github.com/xianzhon/vim-code-runner 
"  call minpac#add('joshdick/onedark.vim')
"  call minpac#add('haishanh/night-owl.vim') vim theme
"  call minpac#add('ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}) file manager
   call minpac#add('thaerkh/vim-indentguides') " indentguides
   call minpac#add('907th/vim-auto-save')
   call minpac#add('airblade/vim-gitgutter') "for git control
"   call minpac#add('Badacadabra/vim-archery') "teming
   call minpac#add('arcticicestudio/nord-vim') "teming
   call minpac#add('github/copilot.vim') 
"especifig for languaje---------------------------------------
  call minpac#add('dart-lang/dart-vim-plugin') "dart 
"  call minpac#add('pr3d4t0r/dart-vim-syntax') "dart
  call minpac#add('natebosch/vim-lsc')
  call minpac#add('natebosch/vim-lsc-dart')
  
  
endfunction

" Plugin settings here.
"coc plugin-----------------------------------------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-json','coc-clangd','coc-python','coc-snippets','coc-texlab','coc-pairs','coc-flutter-tools']

"fuzzy plugin---------------------------------------------------------------------------------------------------------
map ; :Files<CR>
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/pack/minpac/start/fzf.vim/bin/preview.sh {}']}, <bang>0)
let g:fzf_layout = {'left': '30%'}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"nerdtree-------------------------------------------------------------------------------------------------------------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:nerdtree_tabs_open_on_gui_startup=1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <A-f> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"terminal---------------------------------------------------------------------------------------------------------------
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <a-t> :call OpenTerminal()<CR> 

"airline-----------------------------------------------------------------------------------------------------------------
let g:webdevicons_enable_airline_tabline = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


"vim theme----------------------------------------------------------------------------------------------------------------
"colorscheme night-owl
set background=dark
colorscheme nord
"let g:material_style='palenight'
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"code runer---------------------------------------------------------------------------------------------------------------
"nnoremap <F5> <plug>CodeRunner
nmap <F5> <plug>CodeRunner
let g:code_runner_save_before_execute = 1
"add support for dart
let g:CodeRunnerCommandMap = {
      \ 'dart' : 'dart --enable-asserts $fileName'
      \}

"vimdart plugin-----------------------------------------------------------------------------------------------------------
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

"vim lsc------------------------------------------------------------------------------------------------------------------
let g:lsc_auto_map = v:true

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1

"for autosave------------------------------------------------------------------------------------------------------------------
" Enable autosave plugin
let g:auto_save = 1
"And now turn Vim swapfile off
set noswapfile

"gitgutter---------------------------------------------------------------------------------------------------------------------
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

"theme archery-----------------------------------------------------------------------------------------------------------------------
"set showtabline=2
"set laststatus=2

"for coc-snippet---------------------------------------------------------------------------------------------------------------------
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"minpac commands----------------------------------------------------------------------------------------------------------
"command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
