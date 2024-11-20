"------------------------------------------------
" Environment Settings
"------------------------------------------------

filetype on
set clipboard=unnamedplus
set guioptions-=T
set hlsearch
set mouse=a
set nobackup
set noerrorbells visualbell t_vb=
set noswapfile
set notitle
set nowritebackup
set number
set scrolloff=2
set showtabline=2
set statusline=%F
syntax off

"------------------------------------------------
" Autocomplete Settings
"------------------------------------------------

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set wrap

"------------------------------------------------
" Aliases / Command Shortcuts
"------------------------------------------------

command! Svr source ~/.vimrc
nnoremap <F6> :q<CR>
nnoremap <F7> :w<CR>
vnoremap <Leader>y :!xsel --clipboard --input<CR><CR>
nnoremap <Leader>Y :.w !xsel --clipboard --input<CR><CR>
command! Vimrc e $MYVIMRC

"------------------------------------------------
" Functions
"------------------------------------------------

" Remove Duplicates After
function! RemoveDup()
    let seen = {}
    for i in range(1, line('$'))
        let current_line = getline(i)
        if has_key(seen, current_line)
            call setline(i, '')
        else
            let seen[current_line] = 1
        endif
    endfor
endfunction
noremap <leader>rd :call RemoveDup()<CR>

" Remove Anything Duplicated
function! RemoveAllDup()
    let seen = {}
    for i in range(1, line('$'))
        let current_line = getline(i)
        if has_key(seen, current_line)
            let seen[current_line] += 1
        else
            let seen[current_line] = 1
        endif
    endfor
    for i in range(1, line('$'))
        let current_line = getline(i)
        if seen[current_line] > 1
            call setline(i, '')
        endif
    endfor
endfunction
nnoremap <leader>rda :call RemoveAllDup()<CR>

" Comment Python / Shell Lines
function! Comment(start, end)
    for line_num in range(a:start, a:end)
        let line_content = getline(line_num)
        call setline(line_num, '#' . line_content)
    endfor
endfunction
nnoremap <leader>c :call Comment(line("'<"), line("'>"))<CR>

" Uncomment Python / Shell Lines
function! Uncomment(start, end)
    for line_num in range(a:start, a:end)
        let line_content = getline(line_num)
        if line_content =~? '^?'
            let uncommented_line = substitute(line_content, '^#', '', '')
            call setline(line_num, uncommented_line)
        endif
    endfor
endfunction
nnoremap <leader>u :call Uncomment(line("'<"), line("'>"))<CR>

" Tab Lines
function! TabLines(start, end)
    execute a:start . ',' . a:end . 'normal >>'
endfunction

" Untab Lines
function! UnTabLines(start, end)
    execute a:start . ',' . a:end . 'normal <<'
endfunction

" Configure Makefiles
function! SetMakefileSettings()
    setlocal noexpandtab    " Use actual tabs instead of spaces
    setlocal tabstop=8      " Set tab width to 8 spaces
    setlocal shiftwidth=8   " Set shift width to 8 spaces
    echo 'Makefile settings applied'
endfunction
command! MakefileSettings call SetMakefileSettings()

" Enable Ctags
function! SetTags()
    set tags=./tags;,tags
endfunction
command! SetTags call SetTags()
