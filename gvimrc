"GUI options
set gfn=Monaco:h12
set go=aegimrLtb
set showtabline=2
"set guicursor="n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,	r-cr:hor20-Cursor/lCursor, sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
set guitablabel=%N%m\ %t
"==============================================================================
" Mac specific
if has("gui_macvim")
    set macmeta
    " fullscreen maximizes vertically AND horizontally
    set fuoptions=maxvert,maxhorz

    " Width of window.
    set columns=270

    " Height of window.
    set lines=62

    " Don't focus the window when the mouse pointer is moved.
    set nomousefocus

    " Hide mouse pointer on insert mode.
    set mousehide

    " TABS: safari style tab navigation
    nmap <D-S-[> :tabprevious<CR>
    nmap <D-S-]> :tabnext<CR>
    map <D-S-[> :tabprevious<CR>
    map <D-S-]> :tabnext<CR>
    imap <D-S-[> <C-O>:tabprevious<CR>
    imap <D-S-]> <C-O>:tabnext<CR>

    " TABS: Firefox style, open tabs with command-<tab number>
    map <silent> <D-1> :tabn 1<CR>
    map <silent> <D-2> :tabn 2<CR>
    map <silent> <D-3> :tabn 3<CR>
    map <silent> <D-4> :tabn 4<CR>
    map <silent> <D-5> :tabn 5<CR>
    map <silent> <D-6> :tabn 6<CR>
    map <silent> <D-7> :tabn 7<CR>
    map <silent> <D-8> :tabn 8<CR>
    map <silent> <D-9> :tabn 9<CR>

    imap <silent> <D-1> <Esc>:tabn 1<CR>a
    imap <silent> <D-2> <Esc>:tabn 2<CR>a
    imap <silent> <D-3> <Esc>:tabn 3<CR>a
    imap <silent> <D-4> <Esc>:tabn 4<CR>a
    imap <silent> <D-5> <Esc>:tabn 5<CR>a
    imap <silent> <D-6> <Esc>:tabn 6<CR>a
    imap <silent> <D-7> <Esc>:tabn 7<CR>a
    imap <silent> <D-8> <Esc>:tabn 8<CR>a
    imap <silent> <D-9> <Esc>:tabn 9<CR>a

    " bind command-] to shift right (XCode like)
    nmap <D-]> >>
    vmap <D-]> >
    imap <D-]> <C-O>>>

    " bind command-[ to shift left
    nmap <D-[> <<
    vmap <D-[> <
    imap <D-[> <C-O><<

    nmap <D-Left> <Home>
    vmap <D-Left> <Home>
    nmap <D-Right> <End>
    vmap <D-Right> <End>

    " Moving around through wrapped lines
    vmap <D-j> gj
    vmap <D-k> gk
    nmap <D-j> gj
    nmap <D-k> gk
endif

