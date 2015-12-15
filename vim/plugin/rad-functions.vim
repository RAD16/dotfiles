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

"------- Convert msg to ToDo list, compatible with NoNonsense Notes app
function! Todo()
	:normal! gg
	:%normal! 0i* TODO j
endfunction
com! Todo call Todo()

function! Done()
 :normal! 0fTciwDONE
endfunction
com! Done call Done()

function! UnDone()
 :normal! 0fDciwTODO
endfunction
com! UnDone call UnDone()

function! ClearTodo()
	:normal gg
	:%normal d2wj
endfunction
com! ClearTodo call ClearTodo()

" Keymappings
nnoremap <leader>td :Todo<cr>
nnoremap <leader>dt :Done<cr>
nnoremap <leader>ut :UnDone<cr>
nnoremap <leader>ct :ClearTodo<cr>

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
