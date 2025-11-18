"NORMAL MODE
nnoremap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>1 :!<CR>
nnoremap <Space> }
nnoremap <S-CR> gf
nnoremap <BS> :e #<CR>
nnoremap <leader><leader> :Files<CR>

"INSERT MODE
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <C-K>  <Esc><S-O>

"VISUAL MODE
vnoremap <C-C> :!wl-copy<CR>u

