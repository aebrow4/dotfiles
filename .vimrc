execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme gruvbox
set nu
set hidden
" set expandtab
" set shiftwidth=2
" set softtabstop=2

" Buffer navigation
nmap <leader>T :enew<CR>
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>
" vim-bufkill - Buffer deletion and wiping
nmap <leader>bd :BD<CR>
nmap <leader>bw :BW<CR>

" make j and k not behave line-wise for wrapped lines
nmap j gj
nmap k gk

nmap B 0v$h

" map leader to spacebar
map <space> <leader>

" Split navigation
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k

" cut from the left of the cursor and append to the line above
nmap , v$hdkA<space><esc>P

" Store yanked text in the clipboard too
set clipboard=unnamed

" delete text without storing it in a register
xnoremap x "_d
nnoremap x "_x

" Case insensitive search unless caps
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader>c :nohlsearch<CR>

" indenting
vmap zi I<tab><esc>
" Search
" Add homebrew installed fzf to runtimepath
set rtp+=/usr/local/opt/fzf
" make fzf use ag instead of find. ag respects .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" fuzzy-finding for file names
nmap <leader>t :FZF<CR>
" Use fzf + ag for fuzzy-find grepping
command! -bang -nargs=* Agf
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:35%', '?'),
  \                 <bang>0)
" fuzzy grep the whole codebase:
nmap <leader>g :Agf<CR>
" fuzzy grep the current file:
nmap <leader>s :BLines<CR>


" NERDTree
" Toggle NERDTree, and highlighting current file in the tree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Syntastic
" Mysterious recommended syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" nmap <leader>; :SyntasticCheck<CR>
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = 'x'
" let g:syntastic_style_error_symbol = 'o'
" let g:syntastic_warning_symbol = '^'
" let g:syntastic_style_warning_symbol = '`'
" Active checking (meaning on save, not on change) doesnt seem to be working
" tho
" let g:syntastic_mode_map = {
"     \ "mode": "active",
"     \ "active_filetypes": ["python", "javascript"] }
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" let g:syntastic_javascript_checkers=['eslint']


" Airline
" Enable buffer status line in top of window and display only the filename
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" remove chunks, file encoding, percentage, line, col #
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
" display lint errs and warnings
let g:airline#extensions#syntastic#stl_format_err = 1
let g:airline#extensions#syntastic#stl_format_warn = 1

let g:AutoPairsUseInsertedCount = 1

" closetage config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


let g:javascript_plugin_jsdoc = 1

let g:prettier#exec_cmd_async = 1

nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap - ddp
nnoremap + ddkkp 
" need to modify this one so that the selection stays selected after
" vnoremap - xp 
" vnoremap + xkkp 
"
inoremap <c-cr> <esc><cr>

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set statusline+=%{SyntaxItem()}

