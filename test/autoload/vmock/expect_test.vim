let s:t = vimtest#new('vmock#expect get_return_value()') "{{{

function! s:t.setting_return_value()
  for v in [20, 'hoge', [1, 2]]
    let expect = vmock#expect#new('g:vmock_hoge').return(v)
    call self.assert.equals(v, expect.get_return_value())
    unlet v
  endfor
endfunction
"}}}
let s:t = vimtest#new('vmock#expect counter') "{{{

function! s:t.default_is_any()
  let expect = vmock#expect#new('g:vmock_hoge')
  call self.assert.equals('any', expect.get_counter().__name)
endfunction

function! s:t.once()
  let expect = vmock#expect#new('g:vmock_hoge').once()
  call self.assert.equals('once', expect.get_counter().__name)
endfunction

function! s:t.times()
  let expect = vmock#expect#new('g:vmock_hoge').times(1)
  call self.assert.equals('times', expect.get_counter().__name)
endfunction

function! s:t.at_least()
  let expect = vmock#expect#new('g:vmock_hoge').at_least(1)
  call self.assert.equals('at_least', expect.get_counter().__name)
endfunction

function! s:t.at_most()
  let expect = vmock#expect#new('g:vmock_hoge').at_most(1)
  call self.assert.equals('at_most', expect.get_counter().__name)
endfunction

function! s:t.any()
  let expect = vmock#expect#new('g:vmock_hoge').any()
  call self.assert.equals('any', expect.get_counter().__name)
endfunction

function! s:t.never()
  let expect = vmock#expect#new('g:vmock_hoge').never()
  call self.assert.equals('never', expect.get_counter().__name)
endfunction
"}}}
let s:t = vimtest#new('vmock#expect with()') "{{{

function! s:t.default_is_empty_matcher()
  let expect = vmock#expect#new('g:vmock_hoge')
  call self.assert.equals(0, expect.get_matcher().__matchers_len)
endfunction

function! s:t.exception_when_empty_args()
  call self.assert.throw('VMock:Required args')
  let expect = vmock#expect#new('g:vmock_hoge').with()
endfunction

function! s:t.setting_matchers()
  let expect = vmock#expect#new('g:vmock_hoge').with(1)
  call self.assert.equals(1, expect.get_matcher().__matchers_len)
  let expect = vmock#expect#new('g:vmock_hoge').with(1, 'a')
  call self.assert.equals(2, expect.get_matcher().__matchers_len)
  let expect = vmock#expect#new('g:vmock_hoge').with(1, 'a', {'key': 'val'})
  call self.assert.equals(3, expect.get_matcher().__matchers_len)
endfunction

function! s:t.exception_on_multiple_caled()
  call self.assert.throw('VMock:with is already set up.')
  call vmock#expect#new('g:vmock_hoge').with(1).with(2)
endfunction
"}}}
