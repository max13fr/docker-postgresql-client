" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nocompatible        " Use Vim settings, rather then Vi settings (much better!).
set nonu                " Hide line number
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set hidden              " Hide buffers when they are abandoned
set ts=4                " Tab size
set history=100         " lines of command history
set hlsearch            " highlight searched-for phrases
set incsearch           " highlight search as you type
set backspace=indent,eol,start
set scrolloff=8

" Indent
set cindent
set smartindent
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable/disable paste mode on F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set paste " mode copier/coller par défaut

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Encoding terminal
set encoding=utf8

" Better command-line completion
set wildmenu

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Fix PageUp/PageDown for normal and visual mode
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

" Status bar
function! Time()
  return strftime("%d/%m/%Y %X", getftime(bufname("%")))
endfunction
set laststatus=2                                        " Always display a status line at the bottom of the window
set statusline=\ %f\                                    " Filename
set statusline+=[%{strlen(&fenc)?&fenc:&enc},\          " Encoding (latin1, utf8, ...)
set statusline+=%{&ff}]                                 " Format (unix, ...)
set statusline+=%(\[%M%R%H]%)                           " Flags (modified, readonly, help)
set statusline+=%=                                      " Right alignment
set statusline+=\ line\ %l\/%L\                         " Line
set statusline+=\(last\ modif\ :\ %{Time()})            " Last modif
