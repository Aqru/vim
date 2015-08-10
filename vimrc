filetype off
call pathogen#infect()
call pathogen#helptags()
set foldmethod=indent
set foldlevel=99
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
"%{fugitive#statusline()}
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
" Rope AutoComplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

" Minimal number of screen lines to keep above and below the cursor.
" This keeps the cursor always in the vertical middle of the screen.
set scrolloff=999

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

:set number

:set cursorline

" 256-color terminal
set t_Co=256
" тему можно также поставить прямо в .vimrc
color spacegray
