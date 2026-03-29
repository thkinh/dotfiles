" VimWiki configs
autocmd VimEnter * hi VimwikiHeader1 ctermfg=red guifg=red
autocmd VimEnter * hi VimwikiHeader2 ctermfg=yellow guifg=yellow
autocmd VimEnter * hi VimwikiHeader3 ctermfg=green guifg=green
autocmd VimEnter * hi VimwikiHeader4 ctermfg=cyan guifg=cyan
autocmd VimEnter * hi VimwikiLink ctermfg=cyan guifg=cyan gui=underline term=underline
autocmd VimEnter * hi VimwikiList ctermfg=magenta guifg=magenta


autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
function! g:LatexPasteImage(relpath)
    execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
    let ipos = getcurpos()
    execute "normal! a" . "mage}"
    call setpos('.', ipos)
    execute "normal! ve\<C-g>"
endfunction

autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'

