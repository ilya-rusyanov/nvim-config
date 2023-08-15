require('plugins')
require('settings')

vim.cmd([[
let g:nvim_conf = fnamemodify(expand("$MYVIMRC"), ":p:h")
let &runtimepath = &runtimepath . ',' . nvim_conf . '/bundle/vim-pathogen'

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

call plug#end()

execute pathogen#infect()

set fencs=utf8,cp1251
set splitright
set termguicolors
set background=dark
set shiftwidth=4
set expandtab
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1
set undofile
set ignorecase
set smartcase
set colorcolumn=80
set cursorcolumn
set cursorline
set title
set mouse=a
set hidden
set textwidth=80
set scrolloff=5
set cinoptions=g-4
set autowrite

au BufRead,BufNewFile *.qbs set filetype=qbs

let g:go_doc_popup_window = 1

"" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nnoremap <leader>jd :YcmCompleter GoTo<CR>

let g:cmake_compile_commands = 1
let g:cmake_project_generator = "Ninja"
let g:cmake_usr_args = "-C ~/.cmake_defs.cmake"

nnoremap m<Space> :make<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>gt <Plug>(go-test)

let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
let g:clang_format#auto_format=1
autocmd FileType c,cpp,objc,proto nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,proto vnoremap <buffer><Leader>cf :ClangFormat<CR>

command Vg vertical G

let g:clang_format#command = "clang-format"

let g:gitgutter_max_signs = 1500

let $GTEST_COLOR=0
let $GTEST_BRIEF=1

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

augroup GTest
        autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
        autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
        autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
        autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
        autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
        autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
        autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END

"Toggle YouCompleteMe on and off with F3
function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
map <F3> :call Toggle_ycm() <CR>
]])
