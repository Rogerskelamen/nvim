setlocal shiftwidth=2 softtabstop=2 expandtab smarttab

noremap ,b a****<Esc>hi
noremap ,i a**<Esc>i
noremap ,u a<u></u><Esc>3hi
noremap ,c a``````<Esc>2hi<CR><Esc>kA
noremap ,$ a$$<CR>$$<Esc>O
noremap ,k a<kbd></kbd><Esc>5hi

" Create markmap from current markdown file
nnoremap <Leader>z :CocCommand markmap.watch<CR>
