" Remap leader key
let mapleader = " "
let maplocalleader = " "

" Don't add to clipboard with deleting with x
vnoremap x "_x
nnoremap x "_x

inoremap <C-h> <Left>        
inoremap <C-j> <Down>       
inoremap <C-k> <Up>       
inoremap <C-l> <Right>   

" Map Tab to indent current line or selected lines
nnoremap <Tab> >>
nnoremap <S-Tab> <<
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Move text up and down
vnoremap J :m .+1<CR>==
vnoremap K :m .-2<CR>==
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

" Paste without overwriting clipboard
vnoremap p "_dP

"Mapping Ctrl + s to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>

" Map Ctrl + p to search files

