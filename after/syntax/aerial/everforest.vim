if !exists('g:colors_name') || g:colors_name !=# 'everforest'
    finish
endif
if index(g:everforest_loaded_file_types, 'aerial') ==# -1
    call add(g:everforest_loaded_file_types, 'aerial')
else
    finish
endif
" syn_begin: aerial {{{
" https://github.com/stevearc/aerial.nvim
highlight! link AerialLine CursorLine
highlight! link AerialGuide LineNr
highlight! link AerialFileIcon Green
highlight! link AerialModuleIcon Purple
highlight! link AerialNamespaceIcon Purple
highlight! link AerialPackageIcon Purple
highlight! link AerialClassIcon Red
highlight! link AerialMethodIcon Green
highlight! link AerialPropertyIcon Blue
highlight! link AerialFieldIcon Green
highlight! link AerialConstructorIcon Green
highlight! link AerialEnumIcon Yellow
highlight! link AerialInterfaceIcon Yellow
highlight! link AerialFunctionIcon Green
highlight! link AerialVariableIcon Blue
highlight! link AerialConstantIcon Blue
highlight! link AerialStringIcon Aqua
highlight! link AerialNumberIcon Aqua
highlight! link AerialBooleanIcon Aqua
highlight! link AerialArrayIcon Aqua
highlight! link AerialObjectIcon Aqua
highlight! link AerialKeyIcon Red
highlight! link AerialNullIcon Aqua
highlight! link AerialEnumMemberIcon Aqua
highlight! link AerialStructIcon Yellow
highlight! link AerialEventIcon Orange
highlight! link AerialOperatorIcon Orange
highlight! link AerialTypeParameterIcon Yellow
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
