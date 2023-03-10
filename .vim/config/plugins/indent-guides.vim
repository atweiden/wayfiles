vim9script

# don't activate on startup
g:indent_guides_enable_on_vim_startup = 0

# disable default mapping <leader>ig for toggling indent-guides
g:indent_guides_default_mapping = 0

# don't classify spaces as indention
g:indent_guides_space_guides = 0

# exclude filetypes
g:indent_guides_exclude_filetypes = [
  'ctrlsf',
  'help',
  'nerdtree'
]

# use custom colors
g:indent_guides_auto_colors = 0

def HighlightIndentGuides(): void
  highlight clear IndentGuidesOdd
  highlight IndentGuidesOdd ctermbg=235 guibg=#F7F7F7
  highlight clear IndentGuidesEven
  highlight IndentGuidesEven ctermbg=234 guibg=#F0F0F0
enddef

augroup indentguides
  autocmd!
  autocmd VimEnter,ColorScheme * HighlightIndentGuides()
augroup END

# facilitate lazy loading
augroup loadindentguides
  autocmd!
  autocmd User LoadIndentGuides ++once packadd vim-indent-guides
augroup END

# toggle minimalist vs nathanaelkane/vim-indent-guides tab highlighting
def ToggleIndentGuides(): void
  silent doautocmd User LoadIndentGuides
  if get(w:, 'igmode', 0)
    indent_guides#disable()
    SetListCharsTabVisible
    SetListCharsRemaining
    w:igmode = 0
  else
    SetListCharsTabInvisible
    SetListCharsRemaining
    indent_guides#init_matches()
    indent_guides#enable()
    w:igmode = 1
  endif
enddef

command! ToggleIndentGuides ToggleIndentGuides()

nnoremap <silent> <F7> :ToggleIndentGuides<CR>
inoremap <silent> <F7> <C-O>:ToggleIndentGuides<CR>
vnoremap <silent> <F7> <ESC>:ToggleIndentGuides<CR>gv

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
