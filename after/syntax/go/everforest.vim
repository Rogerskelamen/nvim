if !exists('g:colors_name') || g:colors_name !=# 'everforest'
    finish
endif
if index(g:everforest_loaded_file_types, 'go') ==# -1
    call add(g:everforest_loaded_file_types, 'go')
else
    finish
endif
" syn_begin: go {{{
" builtin: https://github.com/fatih/vim-go {{{
highlight! link goPackage Define
highlight! link goImport Include
highlight! link goVar OrangeItalic
highlight! link goConst goVar
highlight! link goType Yellow
highlight! link goSignedInts goType
highlight! link goUnsignedInts goType
highlight! link goFloats goType
highlight! link goComplexes goType
highlight! link goVarDefs Aqua
highlight! link goDeclType OrangeItalic
highlight! link goFunctionCall Function
highlight! link goPredefinedIdentifiers Aqua
highlight! link goBuiltins Function
highlight! link goVarArgs Grey
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link goTSInclude Purple
highlight! link goTSNamespace Fg
highlight! link goTSProperty Identifier
highlight! link goTSConstBuiltin AquaItalic
if has('nvim-0.8.0')
  highlight! link @include.go goTSInclude
  highlight! link @namespace.go goTSNamespace
  highlight! link @property.go goTSProperty
  highlight! link @constant.builtin.go goTSConstBuiltin
endif
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
