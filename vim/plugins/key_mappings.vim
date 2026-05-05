"NORMAL MODE
nnoremap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>1 :!<CR>
nnoremap <Space> }
nnoremap <leader><CR> gf
nnoremap <BS> :e #<CR>
nnoremap <leader><leader> :Files<CR>
nnoremap <C-B> <ESC>:Lex<CR>:vertical resize 25<CR>
nnoremap <leader>2 :terminal<CR><C-W>:wincmd J<CR><C-W>:horizontal resize 10<CR>
nnoremap <leader>f :.,$s/old/new/gc
nnoremap <leader>F :%s/old/new/g
nnoremap <F8> :TagbarToggle<CR>

" Resize splits with Ctrl + Arrow keys
nnoremap <C-Up>    :resize +3<CR>
nnoremap <C-Down>  :resize -3<CR>
nnoremap <C-Left>  :vertical resize -3<CR>
nnoremap <C-Right> :vertical resize +3<CR>

"INSERT MODE
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <C-K>  <Esc><S-O>
inoremap <C-B>  <ESC>:Lex<CR>:vertical resize 25<CR>

"VISUAL MODE
" vnoremap <C-C> :!wl-copy<CR>u
xnoremap <C-c> y:call system('wl-copy', @")<CR>[27;5;106~
