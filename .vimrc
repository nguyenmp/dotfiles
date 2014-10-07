execute pathogen#infect()
syntax on
filetype plugin indent on

:let g:tabsize = 4

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype plugins for lang-specific scripts

:set nocompatible " Disable vi compatability
:set expandtab    " Spaces to tabs
:let &tabstop = g:tabsize    " Number of  spaces per tab
:let &shiftwidth = tabsize " Number of spaces for indentation
:set number       " Enable line numbers
:set relativenumber" Enable line numbers
:set ruler        " Show row and column at bottom right
:set incsearch    " Incremental searches
:set ignorecase   " Ignore cases in searches
:set smartcase    " Case sensitive only if pattern includes uppercase letter
:set autoindent   " Auto-indent new lines
:set smartindent  " Auto-indent at beginning of lines
:set smarttab     " Get backspaces to work with tab-spaces
:set mouse=a
:set ttymouse=xterm2

:set backspace=indent,eol,start
:set hlsearch

"highlight clear SignColumn " Remove background highlighting for gutter
highlight LineNr ctermfg=darkgrey ctermbg=NONE " Dark grey line numbers

" Start CtrlP with ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

:map <C-C> :call ToggleCopyMode()<CR>

function! ToggleCopyMode()
    if &mouse == 'a'
        set mouse=v
        set nonumber
        set norelativenumber
        set noai nocin nosi inde=
        set formatoptions=
        echo "Copy-Paste Mode Enabled"
    else
        set mouse=a
        set number
        set relativenumber
        set ai cin si inde=<CR>
        set formatoptions=crotq
        echo "Copy-Paste Mode Disabled"
    endif
endfunction

" :W as an alias for :w (argh)
map :W <Esc>:w

" :nt as a shortcut for opening NERDTree
map :nt <Esc>:NERDTree<CR>

" :nf as a shortcut for revealing current file in NERDTree
map :nf <Esc>:NERDTreeFind<CR>

" Close NERDTree if it is the last and only buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show the status line at the bottom
:set laststatus=2

" ctrl-l - next tab
" ctrl-h - previous tab
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" coloc /nocoloc to toggle color column
map :coloc :set colorcolumn=80<CR>
map :nocoloc :set colorcolumn=<CR>

" pa /nopa to toggle paste
map :pa :set paste<CR>
map :nopa :set nopaste<CR>

" :t as an abbreviation for :tabnew
ca t tabnew

" :tabu as an abbreviation for :Tabularize
ca tabu Tabularize

" :ack as an alias for :Ack! -Q
" Avoids opening first match in buffer, and escapes literal strings
cnoreabbrev ack Ack! -Q
cnoreabbrev Ack Ack! -Q

" :tabue to align by equal signs
cnoreabbrev tabue Tabularize /=

" :tabub to align by {
cnoreabbrev tabub Tabularize /{

" Open symbol in a new tab with ctrl-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" :tb as a shortcut for :tab ball (Opens all buffers in tabs)
map :tb :tab ball<CR>

" :bo as a shortcut cfor closing all buffers but this one
map :bo <Esc>:BufOnly<CR>

" Shift-Tab to de-indent current line (insert mode)
imap <S-Tab> <C-o><<

" d2s to convert double quotes to single quotes on current line
map :d2s :s/"/'/g<CR>

" s2d to convert single quotes to double quotes on current line
map :s2d :s/'/"/g<CR>

" :mouseon and :mouseoff and enabling mouse support
map :mouseon :set mouse=a<CR>
map :mouseoff :set mouse=<CR>

" Alias :cc and :cu to \cc and \cu respsectively
map :cc <Leader>cc
map :cu <Leader>cu

" Open new split panes to right and bottom
set splitbelow
set splitright

" vim-rspec mappings
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>"

" Enable indentation with tab and shift-tab in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
