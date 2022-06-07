"vim settings
source $HOME/.config/nvim/general/settings.vim

"vim mapping
source $HOME/.config/nvim/general/mappings.vim

"vim barbar mappings
source $HOME/.config/nvim/general/barMappings.vim


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
   call minpac#add('vim-airline/vim-airline-themes')
   call minpac#add('shaunsingh/nord.nvim') "teming
   call minpac#add('github/copilot.vim') 
"   call minpac#add('moll/vim-bbye')  "for buffer
   call minpac#add('junegunn/goyo.vim') "distraction free
   call minpac#add('kyazdani42/nvim-web-devicons') "barbar
   call minpac#add('romgrk/barbar.nvim') " barbar
"especifig for languaje---------------------------------------
   call minpac#add('dart-lang/dart-vim-plugin') "dart 
"   call minpac#add('pr3d4t0r/dart-vim-syntax') "dart
"   call minpac#add('natebosch/vim-lsc')
"   call minpac#add('natebosch/vim-lsc-dart')
   call minpac#add('robbyrussell/oh-my-zsh')
   call minpac#add('sbdchd/neoformat') "code formatter  
   call minpac#add('itspriddle/vim-shellcheck') " shellcheck

  
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
  split term://zsh
  resize 10
endfunction
nnoremap <a-t> :call OpenTerminal()<CR> 

"airline-----------------------------------------------------------------------------------------------------------------
let g:webdevicons_enable_airline_tabline = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
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
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python'

"vimdart plugin-----------------------------------------------------------------------------------------------------------
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_dart_sdk_path='/home/odysseus/snap/flutter/common/flutter/bin/cache/dart-sdk'

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

"for barbar
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null


"minpac commands----------------------------------------------------------------------------------------------------------
"command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
