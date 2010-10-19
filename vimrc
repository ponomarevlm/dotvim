set langmenu=ru_RU.UTF-8
set runtimepath=~/.vim,$VIMRUNTIME

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif


" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

  " Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
  augroup END


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif

		augroup END

		else

		set autoindent		" always set autoindenting on
endif " has("autocmd")

" end of standard stuff from vim distribution ==================================

" using pathogen. Tim, I love you!
filetype plugin indent off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Functions ====================================================================

" tabs moving
function! MoveTabLeft()
    let current_tab = tabpagenr()
   if current_tab > 1
       let current_tab = current_tab - 2
       execute 'tabmove' current_tab
    endif
endfunction

function! MoveTabRight()
    let current_tab = tabpagenr()
    execute 'tabmove' current_tab
endfunction

map <S-M-Left> :call MoveTabLeft()<CR>
map <S-M-Right> :call MoveTabRight()<CR>

" sudo writes
command! -nargs=0 -bang SudoSave :silent! w !sudo tee % &>/dev/null
cmap w!! w !sudo tee % >/dev/null

" Plugins ======================================================================
" Diable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" plug lusty
map <Leader>b :LustyJuggler<CR>
let g:loaded_lustyexplorer = "I don't need LustyExplorer"

" Eclim settings
" <Leader>i imports whatever is needed for current file
nnoremap <silent> <Leader>ji :JavaImportMissing<cr>
" <Leader>d opens javadoc for statement in browser
nnoremap <silent> <Leader>jd :JavaDocSearch -x declarations<cr>
" <Leader><enter> searches context for statement
nnoremap <silent> <Leader><cr> :JavaSearchContext<cr>
" <Leader>jv validates current java file
nnoremap <silent> <Leader>jv :Validate<cr>
" <Leader>jc shows corrections for the current line of java
nnoremap <silent> <Leader>jc :JavaCorrect<cr>
nnoremap <Leader>jsm :exe "JavaSearch -x references -s project -i -p ".expand("<cword>")." -t method"<cr>
nnoremap <Leader>jsc :exe "JavaSearch -x references -s project -i -p ".expand("<cword>")." -t class"<cr>
nnoremap <Leader>jsr :exe "JavaSearch -x references -s project -i -p ".expand("<cword>")." -t reference"<cr>
nnoremap <Leader>jsf :exe "JavaSearch -x references -s project -i -p ".expand("<cword>")." -t field"<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='chrome'
let g:EclimJavaSrcValidate=1

" plug CommandT
let g:CommandTMatchWindowAtTop=0
let g:CommandTMaxHeight=10
set wildignore+=*.class,*.o,.git,.svn,*.png,*.jpg

" plug TagList
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
"let Tlist_Show_One_File = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Update = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Exit_OnlyWindow =1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick=1
let Tlist_Inc_Winwidth=1
let Tlist_File_Fold_Auto_Close = 1
set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
nmap <silent> <F4> :TlistToggle<CR>
imap <silent> <F4> <Esc>:TlistToggle<CR>i

"plug Project
let g:proj_flags="mst"

"plug NERD Commenter - XCode-like comments toggling
nmap <D-/> <Leader>c<space><Down>
vnoremap <D-/> <Esc><Leader>c<space>gv

"plug NERD Tree
let NERDChristmasTree = 1
let NERDTreeHijackNetrw = 0
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let g:NERDTreeMapPreview = '<Right>'
nmap <silent> <F3> :NERDTreeToggle<CR>
imap <silent> <F3> <Esc>:NERDTreeToggle<CR>i

" settings =======================================================

" mine customized one, based on desert
colorscheme desert-px

set diffopt=filler,vertical
" status line format with mapping indicator
set statusline=%<%n\|%f%h%1*%m%*%r%y%=%1*%k%*\ off=%o\ \ %l,%c%V\ %P
highlight User1 term=bold cterm=bold ctermfg=red ctermbg=white guifg=red guibg=white
set laststatus=2
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" red cursor for alternate map
highlight lCursor guifg=NONE guibg=red

" recreate deleted files
autocmd FileChangedShell * if v:fcs_reason == 'deleted' | set modified | endif

" do not keep a backup files, use version control systems instead
set nobackup
set noswapfile

set cmdheight=2
set shortmess=aoOtTIA

"folding
set foldcolumn=4
"set foldmethod=syntax
set foldlevel=1

set background=dark

" redraw rarely
set lazyredraw

" show line numbers, exclude help
set number
autocmd! filetype help setlocal nonumber

" use wildmenu ...
set wildmenu
" ... with completion
set wildcharm=<TAB>

" reapply config after save
autocmd! bufwritepost .vimrc source $MYVIMRC

highlight WrongSpaces guibg=Grey40
" highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('WrongSpaces', '\s\+$', -1)
" highlight tabs between spaces
au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('WrongSpaces', '\v(\t+)\ze( +)', -1)
au BufNewFile,BufRead * let b:mtabaftersp=matchadd('WrongSpaces', '\v( +)\zs(\t+)', -1)

" make shebangs executable
au BufWritePost * if getline(1) =~ "^#!" | silent !chmod a+x <afile>  | endif
" restart Passenger app
au BufWritePost * silent !test -f 'tmp/restart.txt' && touch 'tmp/restart.txt'

autocmd filetype java set noexpandtab

" ignore case in search pattern
set ignorecase
" but don't ignore for mixedcase pattern
set smartcase

" tab is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" show at least n lines around cursor
set scrolloff=2
set sidescrolloff=2

" save all stuff to .viminfo
set viminfo+='1000,f1,<500,:1000,@1000,/1000,h,%

" and in session
set sessionoptions=curdir,folds,globals,help,localoptions,options,resize,winsize,winpos,tabpages

" enable mouse
set mouse=a
set mousemodel=popup_setpos
" break line after full word
set linebreak

" set terminal title
set title
" show matching brackets in insert mode
set showmatch

" set "" to "* (dafault to system)
set clipboard=unnamed

" plain text formatting
autocmd FileType text setlocal fo=atcroqn
autocmd FileType text setlocal textwidth=80
set autoindent
set smartindent

"vim 7.0 settings
set go=aegimrLtb
" keep spellchecker ready, but off by default
map <Leader>s :setlocal spell!<CR>
set nospell
set spelllang=ru_yo,en_us
set spellsuggest=best
set completeopt=menu,preview

" reread file after git checkout
set autoread

" Восстановление позиции курсора при повторном открытии файла
" set viewoptions=cursor,folds
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/


" terminal's enc
set termencoding=utf-8
" all possible file encodings, internal vim's encoding
set fileencodings=utf-8,cp1251,koi8-r
set encoding=utf-8

" show modes, abandon buffers without queastions, highlight line with cursor
set showmode
set hidden
set cursorline
" local usage, show pos in text, save undo across launches
set ttyfast
set ruler
set undofile
set undodir="~/.vim/undo"

" This turns off Vim’s crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" makes it easy to clear out a search
nnoremap <leader>/ :noh<cr>

" make the tab key match bracket pairs. I use this to move around all the time and
" <tab> is a hell of a lot easier to type than %
nnoremap <M-tab> %
vnoremap <M-tab> %

" wrap lines
set wrap
set formatoptions+="qrn"
" highlight 85'th column, exclude help
autocmd FileType help setlocal colorcolumn=""
set colorcolumn=85
hi ColorColumn ctermbg=lightgrey guibg=grey30

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" highlight tabs and spaces, indicate presence of text around buffer
set listchars=tab:▸\ ,eol:¬,trail:-,precedes:<,extends:>

" turned off for security, I don't use it anyway
set modelines=0

" http://nvie.com/posts/how-i-boosted-my-vim/
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" http://writequit.org/blog/?p=195
" show full completion tags
set showfulltag
" do lots of scanning on tab completion
set complete=.,w,b,u,U,t,i,d

" keybindings ==================================================================

" edit config
map <C-F12> :tabnew<Space>~/.vimrc<CR>
" rebind F1 to Esc to never miss
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" line numbers
nmap <F11> :set<Space>number!<CR>
imap <F11> <Esc>:set<Space>number!<CR>i

" line wrapping
nmap <S-F11> :set<Space>wrap!<CR>
imap <S-F11> <Esc>:set<Space>wrap!<CR>i

" paste formatted text
set pastetoggle=<M-F11>

" Insert mode completions
imap <C-Tab> <C-N>
imap <C-Space> <C-N>
" for eclim
imap <C-S-Space> <C-X><C-U>

" save
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>a
nmap <S-F2> :wа<CR>
imap <S-F2> <Esc>:wа<CR>a

" more usable Page Up/Down
nmap <PageUp> <C-S-U><C-S-U>
imap <PageUp> <C-O><C-S-U><C-O><C-S-U>
nmap <PageDown> <C-S-D><C-S-D>
imap <PageDown> <C-O><C-S-D><C-O><C-S-D>

"smart home
nnoremap <silent><Home> :exe 'norm!' matchend(getline('.'),'^\s*')<col('.')-1 ? '^':'0'<CR>
imap <silent><Home> <C-O><Home>

"LESS like
nmap <BS> <C-S-U><C-S-U>
nmap <Space> <C-S-D><C-S-D>
" exit
map <F10> :q<CR>
imap <F10> <ESC>:q<CR>
map <S-F10> :tabclose<CR>
imap <S-F10> <ESC>:tabclose<CR>

" go to next/prev tab, useful in ssh+screen session to not interfer with iTerm's
" bindings
map <Leader>n :tabnext<CR>
map <Leader>p :tabprevious<CR>
map <S-Right> :tabnext<CR>
imap <S-Right> <Esc>:tabnext<CR>i
map <S-Left> :tabprevious<CR>
imap <S-Left> <Esc>:tabprevious<CR>i

"word-jump and selecting
nmap <M-Left> b
nmap <M-Right> e
imap <M-Left> <Esc>bi
imap <M-Right> <Esc>ea
imap <M-S-Left> <Esc>vb
imap <M-S-Right> <Esc>ve

" moving around splited windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
