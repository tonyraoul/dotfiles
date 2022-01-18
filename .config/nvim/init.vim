set colorcolumn=100        " Show right column in a highlighted colour.
set completeopt-=preview   " Do not show preview window for ins-completion.
set diffopt+=foldcolumn:0  " Do not show fold indicator column in diff mode.
set fillchars+=vert:│      " Use full height bar char as vertical separator.
set history=10000          " Number of commands and search patterns to remember.
set laststatus=2           " Always show status line.
set noshowmode             " Do not show current mode on the last line.
set number                 " Show the line number.
set showcmd                " Show command on last line of screen.
set showmatch              " Show matching brackets.
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum" " Enable italics in terminal vim.
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum" " Enable italics in terminal vim.
set termguicolors          " Use gui vim colors in terminal vim.
set title                  " Set window title to 'filename [+=-] (path) - VIM'.

set backspace=2            " Allow <BS> and <Del> over everything.
set hidden                 " Hide when switching buffers instead of unloading.
set mouse=a                " Enable use of the mouse in all modes.
set nowrap                 " Disable word wrap.
set spelllang=en_us        " American english 
set textwidth=0            " Do not break lines after a maximum width.
set wildmenu               " Use enhanced command-line completion.

set foldignore=            " Do not ignore any characters for indent folding.
set foldlevelstart=99      " Always start editing with all folds open.
set foldmethod=indent      " Form folds by lines with equal indent.
set foldnestmax=10         " Limit fold levels for indent and syntax folding.

"}}}
" Options - GUI {{{
" -----------------------------------------------------------------------------

if has('gui_running')
  set guifont=FiraCodeNerdFontComplete-Regular:h16 " Set the font to use.
  set guioptions=                      " Remove all GUI components and options.
  set guicursor+=a:block-blinkon0      " Use non-blinking block cursor.
  set linespace=8                      " Increase line height spacing by pixels.

  " Paste from PRIMARY
  inoremap <silent> <S-Insert> <Esc>"*p`]a
  " Paste from CLIPBOARD
  inoremap <silent> <M-v> <Esc>"+p`]a
endif

"}}}
" Options - Indents and Tabs {{{
" -----------------------------------------------------------------------------

" Default indent and tab options.
set autoindent             " Copy indent from previous line.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=2           " Spaces for each (auto)indent.
set smarttab               " Insert and delete sw blanks in the front of a line.
set softtabstop=2          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=2              " Spaces that a <Tab> in file counts for.

" Indent and tab options for specific file types.
autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType css,markdown,python,php setlocal shiftwidth=4 softtabstop=4 tabstop=4

"}}}
" Options - Searching {{{
" -----------------------------------------------------------------------------

set hlsearch               " Highlight search pattern results.
set ignorecase             " Ignore case of normal letters in a pattern.
set incsearch              " Highlight search pattern as it is typed.
set smartcase              " Override ignorecase if pattern contains upper case.

" Use ripgrep over grep
if executable('rg')
  set grepprg=set grepprg=rg\ --no-heading\ --vimgrep
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'        " Text alignment by characters.
Plug 'morhetz/gruvbox'                " Dark colorscheme.
Plug 'plasticboy/vim-markdown'        " Markdown Vim Mode.
Plug 'scrooloose/nerdtree'            " File explorer window.
Plug 'tpope/vim-commentary'           " Commenting made simple.
Plug 'tpope/vim-fugitive'             " Git wrapper.
Plug 'tpope/vim-repeat'               " Enable repeat for tpope's plugins.
Plug 'tpope/vim-surround'             " Quoting/parenthesizing made simple.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'              " Github wrapper.
Plug 'itchyny/lightline.vim'          " Pretty statusline.
Plug 'ryanoasis/vim-devicons'         " Adds dev icons to plugins
Plug 'dracula/vim', {'as': 'dracula' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/goyo.vim'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'dyng/ctrlsf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'samoshkin/vim-mergetool'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
colorscheme dracula
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" search in files
nnoremap <silent> <C-p> :Files<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Increase default width
let g:NERDTreeWinSize=51

" Toggle NERD tree window.
nnoremap <Leader>1 :NERDTreeToggle<CR>
nnoremap <Leader>2 :NERDTreeFind<CR>

" NERDTree devicons color
highlight! link NERDTreeFlags Special

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>fp <cmd>:grep -F "<C-R><C-W>"

" Floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
