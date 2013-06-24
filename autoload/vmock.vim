" AUTHOR: kanno <akapanna@gmail.com>
" License: This file is placed in the public domain.
let s:save_cpo = &cpo
set cpo&vim

" TODO Funcref...
function! vmock#mock(funcname)
  " TODO autoload
  if !exists('*' . a:funcname)
    call vmock#exception#throw(printf('Function not found. (%s)', a:funcname))
  endif
  let mock = vmock#mock#new()
  let expect = mock.func(a:funcname)
  call vmock#container#add_mock(mock)
  return expect
endfunction

" matcher shortcurt api's"{{{
function! vmock#any()
  return vmock#matcher#with#any()
endfunction

function! vmock#eq(expected)
  return vmock#matcher#with#eq(a:expected)
endfunction

function! vmock#not_eq(expected)
  return vmock#matcher#with#not_eq(a:expected)
endfunction

function! vmock#loose_not_eq(expected)
  return vmock#matcher#with#loose_not_eq(a:expected)
endfunction

function! vmock#loose_eq(expected)
  return vmock#matcher#with#loose_eq(a:expected)
endfunction

function! vmock#type(expected)
  return vmock#matcher#with#type(a:expected)
endfunction

function! vmock#not_type(expected)
  return vmock#matcher#with#not_type(a:expected)
endfunction

function! vmock#has(expected)
  return vmock#matcher#with#has(a:expected)
endfunction

function! vmock#custom(expected)
  return vmock#matcher#with#custom(a:expected)
endfunction
"}}}
let &cpo = s:save_cpo
unlet s:save_cpo
