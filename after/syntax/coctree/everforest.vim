if !exists('g:colors_name') || g:colors_name !=# 'everforest'
    finish
endif
if index(g:everforest_loaded_file_types, 'coctree') ==# -1
    call add(g:everforest_loaded_file_types, 'coctree')
else
    finish
endif
" syn_begin: coctree {{{
" https://github.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Aqua
highlight! link CocTreeDescription Grey
highlight! link CocSymbolFile Green
highlight! link CocSymbolModule Purple
highlight! link CocSymbolNamespace Purple
highlight! link CocSymbolPackage Purple
highlight! link CocSymbolClass Red
highlight! link CocSymbolMethod Green
highlight! link CocSymbolProperty Blue
highlight! link CocSymbolField Green
highlight! link CocSymbolConstructor Green
highlight! link CocSymbolEnum Yellow
highlight! link CocSymbolInterface Yellow
highlight! link CocSymbolFunction Green
highlight! link CocSymbolVariable Blue
highlight! link CocSymbolConstant Blue
highlight! link CocSymbolString Aqua
highlight! link CocSymbolNumber Aqua
highlight! link CocSymbolBoolean Aqua
highlight! link CocSymbolArray Aqua
highlight! link CocSymbolObject Aqua
highlight! link CocSymbolKey Red
highlight! link CocSymbolNull Aqua
highlight! link CocSymbolEnumMember Aqua
highlight! link CocSymbolStruct Yellow
highlight! link CocSymbolEvent Orange
highlight! link CocSymbolOperator Orange
highlight! link CocSymbolTypeParameter Yellow
highlight! link CocSymbolDefault Aqua
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
