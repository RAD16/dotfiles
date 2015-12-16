"======= Custom Functions =====

"----- checklists ----- 
function! MakeCheckBox()
	:normal! mmI * [_] `m
endfunction

function! RemoveCheckBox()
	:normal! mm0rf*df] `m
endfunction

function! Check()
	:normal! mm0f_rx`m
endfunction

function! UnCheck()
	:normal! mm0fxr_`m
endfunction

" Keymappings
nnoremap <leader>X :call MakeCheckBox()<cr>
nnoremap <leader>XX :call RemoveCheckBox()<cr>
nnoremap <leader>x :call Check()<cr>
nnoremap <leader>xx :call UnCheck()<cr>

"------- Create org-mode style TODO lists -----
function! MakeTODO()
	:normal! gg
	:%normal! 0i* TODO j
endfunction
com! MakeTODO call MakeTODO()

function! TODO()
	:normal! mm0i* TODO `m
endfunction
com! TODO call TODO()

function! DONE()
 :normal! mm0:s/TODO/DONE/g`m
endfunction
com! DONE call DONE()

function! NotDONE()
 :normal! mm0:s/DONE/TODO/g`m
endfunction
com! NotDONE call NotDONE()

function! RemoveTODO()
	:normal mm^2dt `m
endfunction
com! RemoveTODO call RemoveTODO()

function! ClearTODO()
	:normal mm:%s/TODO/DONE/g 
	:normal :%s/\* DONE/ /g`m
endfunction
com! ClearTODO call ClearTODO()

" Keymappings
" calling function instead of command 
" allows a range to be given
nnoremap <leader>tt :call TODO()<cr>
nnoremap <leader>rt :call RemoveTODO()<cr>
nnoremap <leader>dt :call DONE()<cr>
nnoremap <leader>nt :call NotDONE()<cr>
"nnoremap <leader>ct :ClearTODO<cr>

"-------- Markdown headers --------
"
function! Header1()
	:normal! mmyypv$r=`m
endfunction
com! H1 call Header1()

function! Header2()
	:normal! mmyypv$r-`m
endfunction
com! H2 call Header2()

function! Header3()
	:normal! ^i###
endfunction
com! H3 call Header3()

function! Header4()
	:normal! ^i####
endfunction
com! H4 call Header4()

" Keymappings
nnoremap <leader>h1 :H1<cr>
nnoremap <leader>h2 :H2<cr>
nnoremap <leader>h3 :H3<cr>
nnoremap <leader>h4 :H4<cr>
