" 行番号出力
set nu
" ctags検索用
set tags=./.tags
" ペースト設定
set paste
set textwidth=80

" viとの互換性off
if !&compatible
  set nocompatible
endif

" プレース移動機能追加
:source $VIMRUNTIME/macros/matchit.vim

augroup RubyCmd
  autocmd! 
  if (exists('+colorcolumn'))
    autocmd BufNewFile,BufRead *.rb setlocal colorcolumn=80
    autocmd BufNewFile,BufRead *.rb highlight ColorColumn ctermbg=9
    set term=screen-256color 
  endif
augroup END

augroup YmlLiquid
  autocmd!
  autocmd BufNewFile,BufRead *.yml.liquid setfiletype yaml
augroup END

" deinインストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_dir = expand('~/.vim/dein')
let s:toml_file = s:toml_dir . '/dein.toml'
" 遅延読み込み設定
let s:lazy_toml_file = s:toml_dir . '/dein_lazy.toml'

" dein読み込み
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file, { 'lazy': 0 })
  call dein#load_toml(s:lazy_toml_file, { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

let g:polyglot_disabled = ['liquid']
