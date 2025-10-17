set number
set relativenumber
" Set shift width to 4 spaces.
set shiftwidth=2

" Set map
command! Nu set relativenumber! | set nu!

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup
set hidden

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
 set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

set novisualbell
syntax enable

set ai
set si
set wrap
set linebreak

" Turn off vim bell sound
autocmd VimEnter * set vb t_vb=

"Copilot enable
let g:copilot_enabled = 0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

