set history=1000                " remember N lines of history
set tabstop=4                   " number of spaces that a <Tab> in the file counts for
set shiftwidth=4                " number of spaces to use for each step of (auto)indent
set autoindent                  " copy indent from current line when starting a new line
set expandtab                   " use the appropriate number of spaces to insert a <Tab>
set shiftround
set number                      " show line numbers
set nowrap
set showmatch                   " show matching bracket
set hlsearch                    " highlight all matches of a previous search pattern
set incsearch                   " while typing a search command, show where the pattern matches so far
set wildmode=list:longest,full  " tab completes as expected in command mode
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when upper case present in search
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set cursorline                  " underline current line
set ruler                       " show line and column number of cursor position
if has('mouse')
    set mouse=a                 " allow mouse use if there is one
endif
" turn off backups
set nobackup
set nowb
set noswapfile
set noerrorbells visualbell t_vb=
set guifont=Ubuntu\ Mono\ 12
autocmd GUIEnter * set visualbell t_vb=
" always show status line
set laststatus=2                " needed for vim-airline without split
"set grepprg=grep\ -nH\ $*n      " added for vim-latexsuite
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after " added for vim-latexsuite
set nocompatible                " needed for pencil

"let g:tex_flavor = "latex"      " added for vim-latexsuite

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'

let g:languagetool_jar = "~/LanguageTool/languagetool-commandline.jar"

" spellcheck settings
set spell                       " maybe spelling by default?
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" autoformat settings
au BufWrite * :Autoformat
let g:formatdef_my_custom_cpp = '"astyle --mode=c --style=allman -SfpHk3W3ycxC90"'
let g:formatters_c = ['my_custom_cpp']

syntax on
filetype plugin on
filetype indent on

match TODO /\s\+$/              " highlights trailing whitespace with the ugly 'TODO' color

" auto install YCM after updating
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/a.vim'                " switch between header and source C++ files with :A
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Townk/vim-autoclose'              " awesome plugin that will automatically insert matching braces, parens, quotes, etc.
Plug 'Chiel92/vim-autoformat'           " autoformat files
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'               " git
Plug 'vim-scripts/LanguageTool'         " grammar checking
"Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'             " syntax checking
Plug 'reedes/vim-pencil'                " nice writing and wrapping tools
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'tpope/vim-commentary'             " comment stuff out
Plug 'tpope/vim-dadbod'                 " interact with databases
Plug 'w0rp/ale'                         " async lint engine
Plug 'sheerun/vim-polyglot'             " a solid language pack
" on-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" pencil settings
let g:pencil#autoformat = 1             " use vim's autoformatting in hard mode
augroup pencil
    autocmd!
    autocmd FileType text         call pencil#init()
    autocmd FileType latex,tex    call pencil#init({'wrap': 'hard'})
augroup END

