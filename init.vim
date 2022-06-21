" Polyglot {{{
  let g:polyglot_disabled = ['markdown', 'autoindent']
" }}}
" Plugin {{{
call plug#begin()
  " Themes | Icons {{{
    Plug 'Rigellute/shades-of-purple.vim' " Theme
    Plug 'mhinz/vim-startify' " Nice Start Screen
    Plug 'ryanoasis/vim-devicons' " Icons
    Plug 'vim-airline/vim-airline' " Details for bar and tabs
    Plug 'vim-airline/vim-airline-themes'
  "}}}

  " Language Integration{{{
    Plug 'OmniSharp/omnisharp-vim'
    " Mappings, code-actions available flag and statusline integration
    Plug 'nickspoons/vim-sharpenup'
    " Linting
    Plug 'dense-analysis/ale'
    " Completion Manager
    Plug 'prabirshrestha/asyncomplete.vim'
    " Debugging Manager
    Plug 'puremourning/vimspector'
    " Language/File packs for Vim
    Plug 'sheerun/vim-polyglot'
  "}}}

  " Tools {{{
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Directory Explorer
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
    Plug 'junegunn/fzf.vim' " Fuzzy Finder
    Plug 'mileszs/ack.vim' " Fuzzy Finder
    Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] } " Side by Side File editing 
    Plug 'junegunn/vim-easy-align' " Alignment
    " Status-line 
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'

    "Community Bug Fix
    Plug 'antoinemadec/FixCursorHold.nvim'
  "}}}

  " External Integration {{{
    " tmux-vim cross navigation
    Plug 'tpope/vim-fugitive'
    if has('unix')
      Plug 'christoomey/vim-tmux-navigator'
    endif
  " }}}

  " Snippets{{{
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
  "}}}
call plug#end()
"}}}
" General {{{
  " Backwards Compatility
  set nocompatible                " disable compatibility to old-time vi
  set encoding=UTF-8
  "scriptencoding utf-8 

  " Spell checking
  set spell                       " enable spell check (may need to download language package)
  set spelllang=en_us             " language for spell checker

  " Passive Behavior 
  set splitright                  " split to the right first
  set splitbelow                  " split below first
  set mouse=v                     " middle-click paste with
  set mouse=a                     " enable mouse click
  set clipboard=unnamedplus       " using system clipboard
  set scrolloff=999               " Hack for centering screen when navigating
  set path+=**                    " Hack for Vim Fuzzy search because of double wild-card
  set ttyfast                     " Speed up scrolling in Vim
  set notimeout                   " Keep leader from timing out
  set history=1000                " Command History

  " Visual Enhancements
  if has('unix')
    set shell=/usr/bin/fish
  endif
  set wildmode=longest,list       " get bash-like tab completions
  set number                      " add line numbers
  set relativenumber              " add line numbers
  set cursorline                  " highlight current cursor-line
  set statusline=2

  " Folding
  set foldmethod=marker
  set foldmarker={{{,}}}

  " set noswapfile                " disable creating swap file
  " set backupdir=~/.cache/vim    " Directory to store backup files.

  " Built In Plugins
  syntax enable
  filetype plugin indent on       " allow auto-indenting depending on file type
"}}}
" Indentation {{{
  set softtabstop=2               " see multiple spaces as tab-stops so <BS> does the right thing
  set expandtab                   " converts tabs to white space
  set shiftwidth=2                " width for auto-indents
  set autoindent                  " indent a new line the same amount as the line just typed
  set tabstop=2                   " number of columns occupied by a tab
  "set cc=80                      " set an 80 column border for good coding style
"}}}
" Search & Highlighting {{{
  set showmatch                   " show matching
  set hlsearch                    " highlight search
  set incsearch                   " incremental search
  set ignorecase                  " case insensitive
  set smartcase                   " smart case searching 
"}}}
" Styling {{{
  " Theme
  if (has("termguicolors"))
    set termguicolors
  endif

  colorscheme shades_of_purple
  
  " Text Highlighting
  "highlight Normal                                        ctermbg=NONE
  "highlight Folded        cterm=Bold      ctermfg=White   ctermbg=Black

  "highlight Comment       cterm=italic
  "highlight CursorLine    cterm=NONE                      ctermbg=Grey 
  "highlight CursorLineNr  cterm=bold      ctermfg=Green   ctermbg=Black  
  "highlight LineNr        ctermfg=White                   ctermbg=Black 
  
  "highlight SpellBad                      ctermfg=White   ctermbg=Red 
  "highlight spellCap      cterm=NONE      ctermfg=NONE
  "highlight spellRare     cterm=NONE      ctermfg=NONE
  "highlight SpellLocal    cterm=Underline                 ctermbg=NONE
  highlight MatchParen guifg=lightgreen guibg=green

  augroup ColorschemePreferences
    autocmd!
    " Link ALE sign highlights to similar equivalents without background colours
    autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
    autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
    autocmd ColorScheme * highlight link ALEInfoSign    Identifier
  augroup END
"}}}
" Keybindings {{{
  " Save
  nnoremap <C-s> :w<CR>
  " Terminal
  
  if has('unix')
    nnoremap <S-t> :sp<CR>:terminal<CR>:resize 13<CR>
  else 
    nnoremap <S-t> :sp<CR>:terminal bash -l -i<CR>:resize 13<CR>
  endif

  tnoremap <Leader><Tab> <C-\><C-n>
  " move line or visually selected block - alt+j/k
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
  " move split panes to left/bottom/top/right
  nnoremap <A-h> <C-W>H
  nnoremap <A-j> <C-W>J
  nnoremap <A-k> <C-W>K
  nnoremap <A-l> <C-W>L
  " move between panes to left/bottom/top/right
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  " resize windows
  nnoremap <silent> <c-Up> :resize +3<CR>
  nnoremap <silent> <c-Down> :resize -3<CR>
  nnoremap <silent> <c-left> :vertical resize +3<CR>
  nnoremap <silent> <c-right> :vertical resize -3<CR>
  " move to next/previous tab
  nnoremap <silent> <s-h> gT
  nnoremap <silent> <s-l> gt
  " Clear Search
  nnoremap <silent> <Leader>/ :noh<CR>
  " Escape insert mode
  inoremap <Esc> <Esc>
"}}}
" Easy Align {{{
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
"}}}
" ALE: {{{
  let g:ale_sign_error = 'E'
  let g:ale_sign_warning = 'W'
  let g:ale_sign_info = 'I'
  let g:ale_sign_style_error = 'e'
  let g:ale_sign_style_warning = 'w'

  let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}
" Sharpenup: {{{
  " All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
  " :OmniSharpGotoDefinition
  let g:sharpenup_map_prefix = '<Space>os'

  let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
  let g:sharpenup_statusline_opts.Highlight = 0

  augroup OmniSharpIntegrations
    autocmd!
    autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
  augroup END
" }}}
" Lightline: {{{
  let g:shades_of_purple_lightline = 1
  let g:lightline = {
  \ 'colorscheme': 'shades_of_purple',
  \ 'active': {
  \   'right': [
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
  \     ['lineinfo'], ['percent'],
  \     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
  \   ]
  \ },
  \ 'inactive': {
  \   'right': [['lineinfo'], ['percent'], ['sharpenup']]
  \ },
  \ 'component': {
  \   'sharpenup': sharpenup#statusline#Build()
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok'
    \  },
    \ 'component_type': {
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'right'
  \  }
  \}
  " Use unicode chars for ale indicators in the statusline
  let g:lightline#ale#indicator_checking = "\uf110 "
  let g:lightline#ale#indicator_infos = "\uf129 "
  let g:lightline#ale#indicator_warnings = "\uf071 "
  let g:lightline#ale#indicator_errors = "\uf05e "
  let g:lightline#ale#indicator_ok = "\uf00c "
" }}}
" OmniSharp: {{{

  let g:OmniSharp_server_use_net6 = 1
  let g:OmniSharp_selector_ui = 'fzf'
  let g:OmniSharp_selector_findusages = 'fzf'
  let g:OmniSharp_diagnostic_exclude_paths = [
  \ 'obj\\',
  \ '[Tt]emp\\',
  \ '\.nuget\\',
  \ '\<AssemblyInfo\.cs\>'
  \]

  let g:OmniSharp_popup_position = 'peek'
  let g:OmniSharp_popup_options = {
  \ 'winblend': 30,
  \ 'winhl': 'Normal:Normal,FloatBorder:Special',
  \ 'border': 'rounded'
  \}
  let g:OmniSharp_popup_mappings = {
  \ 'sigNext': '<C-n>',
  \ 'sigPrev': '<C-p>',
  \ 'pageDown': ['<C-f>', '<PageDown>'],
  \ 'pageUp': ['<C-b>', '<PageUp>']
  \}

  let g:OmniSharp_want_snippet = 1

  let g:OmniSharp_highlight_groups = {
  \ 'ExcludedCode': 'NonText'
  \}

  set completeopt=longest,menuone,preview
  set previewheight=7

  augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    " autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
    autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

    " Navigate up and down by method/property/field
    autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
    autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
    " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    " Repeat the last code action performed (does not use a selector)
    autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
    autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

    autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
  augroup END
" }}}
" Asyncomplete: {{{
  let g:asyncomplete_auto_popup = 1
  " let g:asyncomplete_auto_completeopt = 0
" }}}
" Vimspector {{{
  " packadd! vimspector
  let g:vimspector_bottombar_height=10
  "let g:vimspector_enable_mappings = 'HUMAN'

  " Debugging{{{
    nnoremap <Leader>d <Plug>VimspectorContinue	"When debugging, continue. Otherwise start debugging.
    nnoremap <Leader>r <Plug>VimspectorRestart	"Restart debugging with the same configuration.
    nnoremap <Leader>p <Plug>VimspectorPause	" Pause debuggee.
    nnoremap <Leader>q <Plug>VimspectorStop	" Stop debugging.
    nnoremap <Leader><S-q> :VimspectorReset<CR>
  "}}}
  
  " Stepping{{{
    "Step Over
    nnoremap <Leader>s <Plug>VimspectorStepOver	
    "Step Into
    nnoremap <Leader>i <Plug>VimspectorStepInto	
    "Step out of current function scope
    nnoremap <Leader>o <Plug>VimspectorStepOut	
    "Run to Cursor
    nnoremap <Leader>c <Plug>VimspectorRunToCursor	
  "}}}
  
  " Breakpoints{{{
    "Toggle line breakpoint on the current line.
    nnoremap <Leader>b <Plug>VimspectorToggleBreakpoint	
    "Add a function breakpoint for the expression under cursor
    nnoremap <Leader><S-b> <Plug>VimspectorAddFunctionBreakpoint	
    "Toggle conditional line breakpoint or logpoint on the current line.
    nnoremap <Leader><C-b> <Plug>VimspectorToggleConditionalBreakpoint	
  "}}}

  " Evaluate{{{
    nnoremap <Leader>e <Plug>VimspectorBalloonEval
    " nnoremap <Leader>w :VimspectorWatch<cword><cr>
  "}}}
  
  " Windows{{{
    nnoremap <Leader>ll :VimspectorToggleLog<cr>
    nnoremap <Leader>lo :VimspectorShowOutput<cr>
    nnoremap <Leader>lb <Plug>VimspectorBreakpoints
    nnoremap <Leader>li :VimspectorDebugInfo<cr>
  "}}}

  " vimspector.json{{{
    syn region jsonComment start="/\*" end="\*/"
    hi link jsonCommentError Comment
    hi link jsonComment Comment
  "}}}
"}}}
" FixCursorHold{{{
  let g:cursorhold_updatetime = 3000 
" }}}
" Dev-Icons{{{
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1

  let g:DevIconsDefaultFolderOpenSymbol=''
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

  " Custom icons for file extensions
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = 'ﯤ'
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = 'ﬥ'

  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.test.ts'] = 'ﭧ'

  " Custom icons for specific filenames
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['ormconfig.js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.env'] = 'ﭩ'
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['src'] = ''
" }}}
" NERDTree {{{
  " enable line numbers
  let NERDTreeShowLineNumbers=1
  " make sure relative line numbers are used
  autocmd FileType nerdtree setlocal number relativenumber

  nnoremap <leader>n :NERDTreeFocus<CR>
  "nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  "nnoremap <C-f> :NERDTreeFind<CR>

  " Function to open the file or NERDTree or netrw.
  "   Returns: 1 if either file explorer was opened; otherwise, 0.
  function! s:OpenFileOrExplorer(...)
      if a:0 == 0 || a:1 == ''
          NERDTree
      elseif filereadable(a:1)
          execute 'edit '.a:1
          return 0
      elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed.
          execute 'Vexplore '.a:1
      elseif isdirectory(a:1)
          execute 'NERDTree '.a:1
      endif
      return 1
  endfunction

  " Auto commands to handle OS commandline arguments
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc()==1 && !exists('s:std_in') | if <SID>OpenFileOrExplorer(argv()[0]) | wincmd p | enew | wincmd p | endif | endif

  " Command to call the OpenFileOrExplorer function.
  command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

  " Command-mode abbreviation to replace the :edit Vim command.
  cnoreabbrev e Edit
" }}}
" FZF{{{
  " Search current lines
  nnoremap <S-f> :BLines<CR>
  " Search open buffers
  nnoremap <C-f>o :Lines<CR> 
  " Search for open buffer
  nnoremap <C-f>b :Buffer<CR>
  " Search current git status
  nnoremap <C-f>d :GFiles?<CR>
  " Search all files in directory
  nnoremap <C-f>a :Files<CR>
  " Search all snippets in directory
  nnoremap <C-f>s :Snippets<CR>
  
" grep/ack/ag{{{
  let g:ackprg = 'ag --vimgrep'
  " Search all file contents in directory
  nnoremap <C-f>e :Rg<CR>
  "}}}
" }}}
" Fugitive{{{
  " Git stage
  nnoremap <Leader>ga :Git add input('git add: ')<CR>
  " Git commit
  nnoremap <Leader>gc Git commit input('git commit: ')<CR>
  " Git status
  nnoremap <Leader>gs :Git status<CR>
  " Git diff 
  " nnoremap <Leader><S-g>d :Git diff<CR>
  " Git diff split view on current buffer
  nnoremap <Leader>gd :Gdiffsplit<CR>
  " Git log
  nnoremap <Leader>gl :Git log<CR> 
  " Git blame (adds new buffer with annotations on left side)
  nnoremap <Leader>gb :Git blame<CR>
  " Git merge tool
  nnoremap <Leader>gm :Git mergetool<CR>
" }}}
