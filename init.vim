"""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""

" copy stuff from here later
" https://github.com/zenbro/dotfiles/blob/master/.nvimrc#L151-L187

" Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""
""" General
""
Plug 'sheerun/vim-polyglot' "Solid syntax and indentation support
Plug 'tpope/vim-sensible' "Many 'default' configurations (some added manually later)
Plug 'scrooloose/nerdtree' "project tree view
Plug 'tpope/vim-repeat' ".-repeat

""""""""""""""""""
""" Surrounds
""
Plug 'alvan/vim-closetag' " check this block later
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitMate'
" Plug 'ervandew/supertab'

""""""""""""""""""
""" IDE powerups
""
Plug 'tomtom/tcomment_vim' "comment(>)/uncomment(<) - gc, gcc, ...
Plug 'fntlnz/atags.vim' " helps tag files (create/update)
Plug 'd0c-s4vage/pct-vim' "code tracker - TODOs and other anotations
Plug 'majutsushi/tagbar' "outline on the right (methods, functions, ...)
Plug 'maralla/completor.vim' " async code completion (as you type) - needs configs
Plug 'sirver/ultisnips' "configurable snippets
Plug 'joonty/vdebug' "debugger for some langs (not go)

""""""""""""""""""
""" Search
""
Plug 'vim-scripts/SearchComplete' "tab-completion in search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " :Files, :Commits, :Find, ...
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" http://blog.owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

""""""""""""""""""
""" Ruby
""
Plug 'vim-ruby/vim-ruby' "ruby files smoothly
Plug 'tpope/vim-rails' "navigation, utilities, cmd integration, ...
Plug 'tpope/vim-rvm' "rvm inside vim
Plug 'tpope/vim-bundler' "bundler inside vim

""""""""""""""""""
""" Git
""
Plug 'Xuyuanp/nerdtree-git-plugin' "git symbols on nerdtree
Plug 'tpope/vim-fugitive' "git on vim



Plug 'scrooloose/syntastic'


Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'

""""""""""""""""""
""" UI
""
"Plug 'dracula/vim'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

syntax on
set termguicolors
colorscheme NeoSolarized
"color dracula
set background=dark

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set smartindent
set autoindent

set showmatch
set number

set mouse=a

"Get current dir with %%
cabbr <expr> %% expand('%:p:h')

"Search highlight cleaner
nnoremap <silent> <esc> :noh<cr><esc>


" Folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"""""""""""""""""""""""""""""""""""""""""""""""
" => sensible++ (github.com/sheerun/vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""
"Reload unchanged files automatically
set autoread
"Support all kind of EOLs by default
set fileformats+=mac
"
"Y yanks from the cursor to the end of line as expected. See :help Y
nnoremap Y y$
"Highlight line under cursor. It helps with navigation
set cursorline
set colorcolumn=80
"Keep x lines above or below the cursor when scrolling.
set scrolloff=5
"Keep x columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=8
"Don't parse modelines (google "vim modeline vulnerability").
set nomodeline
"Disable swap to prevent annoying messages.
set noswapfile
"Ignore case when searching.
set ignorecase
"Don't ignore case when search has capital letter (although also don't ignore case by default).
set smartcase
"Add gems.tags to files searched for tags.
set tags+=gems.tags
"Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]
"Set window title by default.
set title
"Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.bak,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"""""""""""""""""""""""""""""""""""""""""""""""
" => leader configuration
"""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
noremap <Leader>W :w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""
" => (shift) enter adds blank line
"""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate and closetag adjusts
"""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_matchpairs = "(:),[:],{:}"
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

"""""""""""""""""""""""""""""""""""""""""""""""
" => backup and swap files
"""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""
" => fzf + rg
"""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=rg\ --vimgrep
noremap <C-p> :Files <CR>
imap <C-n> <plug>(fzf-complete-line)

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""
"Generate
map <Leader>t :call atags#generate()<cr>
"More than 1 option
nnoremap <leader>s :tselect<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :NERDTreeToggle<CR>
"Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

"""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" => Completor
"""""""""""""""""""""""""""""""""""""""""""""""
let g:completor_rb_omni_trigger = '[^. *\t]\.\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""
" => Git Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" => Vdebug
"""""""""""""""""""""""""""""""""""""""""""""""
let g:vdebug_options = {
\ 'path_maps': {"/Users/Artur/Sites/sispp": "/Users/Artur/Sites/sispp"},
\ 'server': '0.0.0.0'
\}

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_powerline_fonts   = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1


"""""""""""""""""""""""""""""""""""""""""""""""
" => spliting buffers / windows / frames ...
"""""""""""""""""""""""""""""""""""""""""""""""
" window
nmap <Leader>swh  :topleft  vnew<CR>
nmap <Leader>swl  :botright vnew<CR>
nmap <Leader>swk  :topleft  new<CR>
nmap <Leader>swj  :botright new<CR>
" buffer
nmap <Leader>sh  :leftabove  vnew<CR>
nmap <Leader>sl  :rightbelow vnew<CR>
nmap <Leader>sk  :leftabove  new<CR>
nmap <Leader>sj  :rightbelow new<CR>


""""""""""""""""""""""""""""""
" fucntions
""""""""""""""""""""""""""""""
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Change cursor shape between insert and normal mode in iTerm3.app
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
