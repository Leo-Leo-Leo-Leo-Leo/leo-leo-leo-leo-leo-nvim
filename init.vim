" Polyglot {{{
  let g:polyglot_disabled = ['markdown', 'autoindent']
" }}}
" Plugin {{{
  call plug#begin()
    " If a plugin is commented out, it was conflicting with another one or was
    " it was just being tried out but another plugin is currently installed that
    " already does its job.

    " Editing Behavior {{{
      " Auto insert and Delete of pair symbols
      Plug 'jiangmiao/auto-pairs'   
      " Paired Symbol Manipulation
      Plug 'tpope/vim-surround' 
      " Alignment
      Plug 'junegunn/vim-easy-align'   
      " Language Agnostic Folding 
      Plug 'pseewald/vim-anyfold'   
      " Text Completion
      Plug 'prabirshrestha/asyncomplete.vim'
      " Community Bug Fix
      Plug 'antoinemadec/FixCursorHold.nvim' 
      " Persistent Wildmenu
      function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
      endfunction
      Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins')  }

      " }}}
    " External Integration {{{
      " git integration
      Plug 'tpope/vim-fugitive'
      " tmux-vim cross navigation
      if has('unix')
        Plug 'christoomey/vim-tmux-navigator'
      endif
    " }}}
    " Code Snippets {{{
      Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'
      Plug 'mattn/emmet-vim'
    "}}}
    " GUI {{{
      " Themes {{{
        Plug 'dracula/vim' " Theme
        Plug 'morhetz/gruvbox' " Theme
        Plug 'Rigellute/shades-of-purple.vim' " Theme
        Plug 'altercation/vim-colors-solarized' " Theme
      " }}}
      " Icons {{{
        Plug 'ryanoasis/vim-devicons' " Icons
        Plug 'airblade/vim-gitgutter' " Icons for file editing (synced with git, left hand side of screen)
      " }}}
      " Info {{{
        " Status-bar (usually at the bottom)
        " Plug 'vim-airline/vim-airline' " Details for bar and tabs
        " Plug 'vim-airline/vim-airline-themes'
        Plug 'itchyny/lightline.vim'
        Plug 'maximbaz/lightline-ale'
      " }}}
      " Menus & Pop-ups {{{
        " Start Screen
        " Plug 'mhinz/vim-startify'
        " Nested Directory Explorer
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }       
        " Symbol List
        " You will need to install ctags in CLI
        Plug 'tc50cal/vim-taglist' 
        " Fuzzy Finder
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        " Fuzzy Finder, all content of all files
        " You will need to install ack, ag (Silver Surfer) or rip-grep in CLI
        Plug 'mileszs/ack.vim'
        " Side by Side File editing
        Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }  
        " Graphical Debugger
        Plug 'puremourning/vimspector'
      " }}}
      " Language Integration {{{
        " Language/File packs for Vim
        Plug 'sheerun/vim-polyglot'
        " Mappings, code-actions available flag and statusline integration
        " Plug 'nickspoons/vim-sharpenup'
        " Linting
        Plug 'dense-analysis/ale'
        " Commenting
        Plug 'preservim/nerdcommenter'
        " DotNet Debug Server
        " Plug 'OmniSharp/omnisharp-vim'
        " Symbol Hopping
        " Plug 'adelarsq/vim-matchit' comes with neovim by default
        " Rainbow Parenthesis
        " Plug 'frazrepo/vim-rainbow' 
      " }}}
    " }}}

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
  set clipboard+=unnamedplus      " using system clipboard
  set scrolloff=999               " Hack for centering screen when navigating
  set path+=**                    " Hack for Vim Fuzzy search because of double wild-card
  set ttyfast                     " Speed up scrolling in Vim
  set notimeout                   " Keep leader from timing out
  set history=1000                " Command History

  " External Integration
  if has('unix')
    set shell=/usr/bin/fish
    let g:perl_host_prog = "/home/leardotaylor/perl5/bin"
  endif
  if &term =~ '256color'
  " disable Background Color Erase (BCE)
      set t_ut=
  endif
  
  " Visual Enhancements
  set number                      " add line numbers
  set relativenumber              " add line numbers
  set cursorline                  " highlight current cursor-line
  set statusline=2
  set signcolumn=yes

  " Pop-ups
  set wildmenu
  " set wildmode=longest,full " tab completion pop-up in command mode, wilder plugin takes care of this
  set wildignore+=**/node_modules/**,**/dist/**,**/bin/**,**/obj/**
  set completeopt=longest,menuone,preview
  set previewheight=7


  " Folding
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldlevel=99

  " set noswapfile                " disable creating swap file
  " set backupdir=~/.cache/vim    " Directory to store backup files.

  " Built In Plugins
  syntax enable
  filetype plugin indent on       " allow auto-indenting depending on file type
"}}}
" Indentation {{{
  set autoindent                  " indent a new line the same amount as the line just typed
  set shiftwidth=2                " width for auto-indents
  set tabstop=2                   " number of columns occupied by a tab
  set expandtab                   " converts tabs to white space
  set softtabstop=2               " see multiple spaces as tab-stops so <BS> does the right thing
  set cc=120                      " set an 80 column border for good coding style
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
  highlight Normal                                        ctermbg=NONE
  highlight Folded        cterm=Bold      ctermfg=White   ctermbg=Black

  highlight Comment       cterm=italic
  highlight CursorLine    cterm=NONE                      ctermbg=Grey
  highlight CursorLineNr  cterm=bold      ctermfg=Green   ctermbg=Black
  highlight LineNr        ctermfg=White                   ctermbg=Black

  highlight SpellBad                      ctermfg=White   ctermbg=Red
  highlight spellCap      cterm=NONE      ctermfg=NONE
  highlight spellRare     cterm=NONE      ctermfg=NONE
  highlight SpellLocal    cterm=Underline                 ctermbg=NONE
  highlight MatchParen guifg=lightgreen guibg=green

  augroup ColorschemePreferences
    autocmd!
    " Link ALE sign highlights to similar equivalents without background colours
    autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
    autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
    autocmd ColorScheme * highlight link ALEInfoSign    Identifier
  augroup END
"}}}
" TODO: Remove plugin dependancies from here, or only bind them if the plugin
" is loaded with if statememnts (something like that at least.)
" Event Bindings {{{
  autocmd VimEnter * call LoadUserSession()
  function! LoadUserSession()
    " silent! execute 'source Session.vim'
  endfunction

  " autocmd SessionLoadPost * VimspectorLoadSession

  autocmd VimLeave * call SaveUserSession()
  function! SaveUserSession()
    " silent! execute 'mksession!'
    " silent! execute 'VimspectorMkSession'
  endfunction
  " autocmd BufEnter * if bufname('$') != '' && exists('b:NERDTree') && !b:NERDTree.isTabTree() | e | endif
" 
" }}}
" Keybindings {{{
  
  " Leader key, '/' by default
  nnoremap <SPACE> <Nop>
  let mapleader = " "

  " Tab Backward in Insert Mode
  inoremap <S-TAB> <C-d>
  " Save
  nnoremap <C-s> :call SaveUserSession()<CR>
  inoremap <C-s> <esc>:call SaveUserSession()<CR>

  function! SaveUserSession()
    execute 'w'
  endfunction

  " Quit:  Delete Buffer, or quit vim if last buffer. Also closes nameless buffer
  nnoremap <C-q> :call CloseWindow()<CR>
  inoremap <C-q> <esc>:call CloseWindow()<CR>
  function! CloseWindow()
    " if tabpagenr('$') == 1 && winnr('$') == 1 || bufname('$') == ''
      execute 'q'
    " else
      " execute 'bd'
    " endif
  endfunction

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
  
  vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
  vnoremap ?? y/\V<C-R>=escape(@",'/\')<CR><CR>
  " Clear Search
  nnoremap <silent> <Leader>/ :noh<CR>
 
  " Escape insert mode
  inoremap <silent> <Leader><Leader> <Esc>
  " Escape vim's terminal emulator
  tnoremap <silent> <Leader><Leader> <Esc><C-\><C-n>

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
  " let g:sharpenup_map_prefix = '<LEADER>os'
  "
  " let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
  " let g:sharpenup_statusline_opts.Highlight = 0
  "
  " augroup OmniSharpIntegrations
  "   autocmd!
  "   autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
  " augroup END
" }}}
" Lightline: {{{
  
  " let g:shades_of_purple_lightline = 1
  " let g:lightline = {
  " \ 'colorscheme': 'shades_of_purple',
  " \ 'active': {
  " \   'right': [
  " \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
  " \     ['lineinfo'], ['percent'],
  " \     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
  " \   ]
  " \ },
  " \ 'inactive': {
  " \   'right': [['lineinfo'], ['percent'], ['sharpenup']]
  " \ },
  " \ 'component': {
  " \   'sharpenup': sharpenup#statusline#Build()
  " \ },
  " \ 'component_expand': {
  " \   'linter_checking': 'lightline#ale#checking',
  " \   'linter_infos': 'lightline#ale#infos',
  " \   'linter_warnings': 'lightline#ale#warnings',
  " \   'linter_errors': 'lightline#ale#errors',
  " \   'linter_ok': 'lightline#ale#ok'
  "   \  },
  "   \ 'component_type': {
  "   \   'linter_checking': 'right',
  "   \   'linter_infos': 'right',
  "   \   'linter_warnings': 'warning',
  "   \   'linter_errors': 'error',
  "   \   'linter_ok': 'right'
  " \  }
  " \}

  " Use unicode chars for ale indicators in the statusline
  let g:lightline#ale#indicator_checking = "\uf110 "
  let g:lightline#ale#indicator_infos = "\uf129 "
  let g:lightline#ale#indicator_warnings = "\uf071 "
  let g:lightline#ale#indicator_errors = "\uf05e "
  let g:lightline#ale#indicator_ok = "\uf00c "
" }}}
" OmniSharp: {{{

  " let g:OmniSharp_server_use_net6 = 1
  " let g:OmniSharp_selector_ui = 'fzf'
  " let g:OmniSharp_selector_findusages = 'fzf'
  " let g:OmniSharp_diagnostic_exclude_paths = [
  " \ 'obj\\',
  " \ '[Tt]emp\\',
  " \ '\.nuget\\',
  " \ '\<AssemblyInfo\.cs\>'
  " \]
  "
  " let g:OmniSharp_popup_position = 'peek'
  " let g:OmniSharp_popup_options = {
  " \ 'winblend': 30,
  " \ 'winhl': 'Normal:Normal,FloatBorder:Special',
  " \ 'border': 'rounded'
  " \}
  " let g:OmniSharp_popup_mappings = {
  " \ 'sigNext': '<C-n>',
  " \ 'sigPrev': '<C-p>',
  " \ 'pageDown': ['<C-f>', '<PageDown>'],
  " \ 'pageUp': ['<C-b>', '<PageUp>']
  " \}
  "
  " let g:OmniSharp_want_snippet = 1
  "
  " let g:OmniSharp_highlight_groups = {
  " \ 'ExcludedCode': 'NonText'
  " \}
  "
  " augroup omnisharp_commands
  "   autocmd!
  "
  "   " Show type information automatically when the cursor stops moving.
  "   " Note that the type is echoed to the Vim command line, and will overwrite
  "   " any other messages in this space including e.g. ALE linting messages.
  "   " autocmd CursorHold *.cs OmniSharpTypeLookup
  "
  "   " The following commands are contextual, based on the cursor position.
  "   autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  "   autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  "   autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  "
  "   " Navigate up and down by method/property/field
  "   autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  "   autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  "   " Find all code errors/warnings for the current solution and populate the quickfix window
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  "   " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  "   autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  "   " Repeat the last code action performed (does not use a selector)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  "   autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  "
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
  "
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)
  "
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  "   autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
  " augroup END
" }}}
" Asyncomplete: {{{
  let g:asyncomplete_auto_popup = 1
  " let g:asyncomplete_auto_completeopt = 0
" }}}
" Vimspector {{{
  let g:vimspector_bottombar_height=10

  " sign define vimspectorBP text=o             texthl=WarningMsg
  " sign define vimspectorBPCond text=o?        texthl=WarningMsg
  " sign define vimspectorBPLog text=!!         texthl=SpellRare
  " sign define vimspectorBPDisabled text=o!    texthl=LineNr
  " sign define vimspectorPC text=\ >           texthl=MatchParen
  " sign define vimspectorPCBP text=o>          texthl=MatchParen
  " sign define vimspectorCurrentThread text=>  texthl=MatchParen
  " sign define vimspectorCurrentFrame text=>   texthl=Special

  let g:vimspector_sign_priority = {
        \    'vimspectorBP':         3,
        \    'vimspectorBPCond':     2,
        \    'vimspectorBPLog':      2,
        \    'vimspectorBPDisabled': 1,
        \    'vimspectorPC':         999,
  \ }

  " function! CustomiseUI()
  "   call win_gotoid( g:vimspector_session_windows.code  )
  "   " Clear the existing WinBar created by Vimspector
  "   nunmenu WinBar
  "   " Create our own WinBar
  "   nnoremenu WinBar.Kill :call vimspector#Stop( { 'interactive': v:true }  )<CR>
  "   nnoremenu WinBar.Continue :call vimspector#Continue()<CR>
  "   nnoremenu WinBar.Pause :call vimspector#Pause()<CR>
  "   nnoremenu WinBar.Step\ Over  :call vimspector#StepOver()<CR>
  "   nnoremenu WinBar.Step\ In :call vimspector#StepInto()<CR>
  "   nnoremenu WinBar.Step\ Out :call vimspector#StepOut()<CR>
  "   nnoremenu WinBar.Restart :call vimspector#Restart()<CR>
  "   nnoremenu WinBar.Exit :call vimspector#Reset()<CR>
  " endfunction
  
  " augroup MyVimspectorUICustomistaion
  "   autocmd!
  "   autocmd User VimspectorUICreated call s:CustomiseUI()
  " augroup END

  " let g:vimspector_enable_mappings = 'HUMAN'

  " Debugging{{{
    nnoremap <Leader>d :call vimspector#Continue()<CR>
    nnoremap <Leader>r :call vimspector#Restart()<CR>
    nnoremap <Leader>p :call vimspector#Pause()<CR>
    nnoremap <Leader>q :call vimspector#Stop()<CR>
    nnoremap <Leader><S-q> :VimspectorReset<CR>
  "}}}
  
  " Stepping{{{
    "Step Over
    nnoremap <Leader>s :call vimspector#StepOver()<CR>
    "Step Into
    nnoremap <Leader>i :call vimspector#StepInto()<CR>	
    "Step out of current function scope
    nnoremap <Leader>o :call vimspector#StepOut()<CR>
    "Run to Cursor
    nnoremap <Leader>h :call vimspector#RunToCursor()<CR>
  "}}}
  
  " Breakpoints{{{
    "Toggle line breakpoint on the current line.
    nnoremap <Leader>b :call vimspector#ToggleBreakpoint()<CR>
    "Add a function breakpoint for the expression under cursor
    nnoremap <Leader><S-b> <Plug>VimspectorAddFunctionBreakpoint
    "Toggle conditional line breakpoint or logpoint on the current line.
    nnoremap <Leader><C-b> <Plug>VimspectorToggleConditionalBreakpoint
  "}}}

  " Evaluate{{{
    nnoremap <Leader>e eb<Plug>VimspectorBalloonEval
    xmap <Leader>e <Plug>VimspectorBalloonEval

    nnoremap <Leader>w <S-b>vey:VimspectorWatch \V<C-R>=escape(@",'/\')<CR><CR>
    vnoremap <Leader>w y:VimspectorWatch<CR> \V<C-R>=escape(@",'/\')<CR><CR>
     
  "}}}
  
  " Windows{{{
    nnoremap <Leader>ll :VimspectorToggleLog<CR>
    nnoremap <Leader>lo :VimspectorShowOutput<CR>
    nnoremap <Leader>lb :call vimspector#ListBreakpoints()<CR>
    nnoremap <Leader>li :VimspectorDebugInfo<CR>
  "}}}

  " vimspector.json{{{
    syn region jsonComment start="/\*" end="\*/"
    hi link jsonCommentError Comment
    hi link jsonComment Comment
  "}}}
"}}}
" FixCursorHold{{{
  let g:cursorhold_updatetime = 200 
" }}}
" Dev-Icons{{{
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1
" }}}
" NERDTree {{{
  " enable line numbers
  let NERDTreeShowLineNumbers=1
  " make sure relative line numbers are used
  autocmd FileType nerdtree setlocal number relativenumber

  nnoremap <Leader>nt :NERDTreeToggle<CR>
  nnoremap <Leader>nf :NERDTreeFind<CR>
  nnoremap <Leader>nm :NERDTreeMirror<CR>
  nnoremap <Leader>nn :NERDTreeFocus<CR>
 
  " Start NERDTree after vim, move the cursor to previous window.
  " autocmd VimEnter * NERDTree | wincmd p
  " autocmd BufWinEnter * silent! NERDTreeMirror

  " Open the existing NERDTree on each new tab.
  " autocmd TabNew * silent! NERDTreeMirror | wincmd p
  
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  " autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  
  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  " autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  "     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

  " Ssh NERDTree{{{
    " Function to open the file or NERDTree or netrw.
    "   Returns: 1 if either file explorer was opened; otherwise, 0.
    "function! s:OpenFileOrExplorer(...)
    "    if a:0 == 0 || a:1 == ''
    "        NERDTree
    "    elseif filereadable(a:1)
    "        execute 'edit '.a:1
    "        return 0
    "    elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed.
    "        execute 'Vexplore '.a:1
    "    elseif isdirectory(a:1)
    "        execute 'NERDTree '.a:1
    "    endif
    "    return 1
    "endfunction

    "" Auto commands to handle OS commandline arguments
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc()==1 && !exists('s:std_in') | if <SID>OpenFileOrExplorer(argv()[0]) | wincmd p | enew | wincmd p | endif | endif

    "" Command to call the OpenFileOrExplorer function.
    "command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

    "" Command-mode abbreviation to replace the :edit Vim command.
    "cnoreabbrev e Edit
  " }}}

" }}}
" FZF {{{

  " move fzf search pop-up
  let g:fzf_layout = { 'down': '~40%' }
  
  " find current buffer lines
  nnoremap <Leader>fl :BLines<CR>
  " find all marked lines in open buffers
  nnoremap <Leader>fm :Marks<CR>
  " find all lines open buffers
  nnoremap <Leader>fo :Lines<CR> 
  " find all lines in directory
  nnoremap <Leader>fe :Rg<CR>

  " find open buffer
  nnoremap <Leader>fb :Buffer<CR>
  " find modified files
  nnoremap <Leader>fd :GFiles?<CR>
  " find all files
  nnoremap <Leader>ff :Files<CR>
  
  " find snippets
  nnoremap <Leader>fs :Snippets<CR>

" }}}
" Fugitive{{{
  " Git stage
  nnoremap <Leader>ga :Git add input('git add: ')<CR>
  " Git commit
  nnoremap <Leader>gc Git commit input('git commit: ')<CR>
  " Git status
  nnoremap <Leader>gs :Git status<CR>
  " Git diff 
  " nnoremap <Leader>gD :Git diff<CR>
  " Git diff split view on current buffer
  nnoremap <Leader>gd :Gdiffsplit<CR>
  " Git log
  nnoremap <Leader>gl :Git log<CR> 
  " Git blame (adds new buffer with annotations on left side)
  nnoremap <Leader>gb :Git blame<CR>
  " Git merge tool
  nnoremap <Leader>gm :Git mergetool<CR>
" }}}
" Nerd-Commenter {{{
  
  " Create default mappings
  let g:NERDCreateDefaultMappings = 0

  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Add your own custom formats or override the defaults
  " let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable NERDCommenterToggle to check all selected lines is commented or not 
  let g:NERDToggleCheckAllLines = 1

  nnoremap <LEADER>c :call NERDComment('0', 'toggle')<CR>
  xmap <LEADER>c <plug>NERDCommenterToggle

" }}}
" Any-Fold {{{
  " activate anyfold by default
  augroup anyfold
    autocmd!
    autocmd Filetype * AnyFoldActivate
  augroup END

  " disable anyfold for large files
  let g:LargeFile = 1000000 " file is large if size greater than 1MB
  function LargeFile()
    augroup anyfold
      autocmd! " remove AnyFoldActivate
      autocmd Filetype * setlocal foldmethod=indent " fall back to indent folding
    augroup END
  endfunction
  autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif

" }}}
" Wilder {{{

  " Minimal Config
  call wilder#setup({ 
        \ 'modes': [':', '/', '?'],
        \ 'next_key': '<Tab>',
        \ 'previous_key': '<S-Tab>',
        \ 'accept_key': '<Down>',
        \ 'reject_key': '<Up>',
        \ })

  " Visual
  call wilder#set_option(
        \'renderer',
        \ wilder#popupmenu_renderer({
        \     'highlighter': wilder#basic_highlighter(),
        \     'min_width': '100%',
        \     'max_height': '30%',
        \     'reverse': 1,
        \ }))
  
  " Behavior
  call wilder#set_option('pipeline', [
        \   wilder#branch(
        \     wilder#python_file_finder_pipeline({
        \       'file_command': ['rg', '--files', '--vimgrep'],
        \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
        \       'filters' : ['fuzzy_filter', 'difflib_sorter'], 
        \     }),
        \     wilder#cmdline_pipeline(),
        \     wilder#python_search_pipeline(),
        \   ),
        \ ])
" }}}
