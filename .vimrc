set nobackup
set nowritebackup
set hlsearch
set number
set noswapfile
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
"set expandtab
set softtabstop=4
set smartindent
set guioptions-=T
set viminfo=
nnoremap <F7> :w<CR>
nnoremap <F6> :q<CR>
" aliases
command! Svr source ~/.vimrc
" functions
" remove duplicates after
function! RemoveDup()
    let seen = {}
    for i in range(1, line('$'))
        let current_line = getline(i)
        if has_key(seen, current_line)
            call setline(i, "")
        else
            let seen[current_line] = 1
        endif
    endfor
    :g/^$/d
endfunction
noremap <leader>rd :call RemoveDup()<CR>
" remove anything that is duplicated
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
            call setline(i, ")
        endif
    endfor
    :g/^$/d
endfunction
nnoremap <leader>rd :call RemoveAllDup()<CR>
" comment python/shell lines
function! Comment(start, end)
    for line_num in range(a:start, a:end)
        let line_content = getline(line_num)
        call setline(line_num, '#' . line_content)
    endfor
endfunction
" uncomment python/shell lines
function! Uncomment(start, end)
    for line_num in range(a:start, a:end)
        let line_content = getline(line_num)
        if line_content =~ '^#'
            let uncommented_line = substitute(line_content, '^#', '', '')
            call setline(line_num, uncommented_line)
        endif
    endfor
endfunction
" tab lines
function! TabLines(start, end)
    execute a:start . "," . a:end . "normal >>"
endfunction
" untab lines
function! UnTabLines(start, end)
    execute a:start . "," . a:end . "normal <<"
endfunction
