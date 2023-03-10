vim9script

# facilitate lazy loading
augroup loadrainbowparentheses
  autocmd!
  autocmd User LoadRainbowParentheses ++once packadd rainbow_parentheses.vim
augroup END

# toggle rainbow parentheses
nnoremap <silent> <leader>sr :silent doautocmd User LoadRainbowParentheses<CR>:RainbowParentheses!!<CR>

g:rainbow#max_level = 16
g:rainbow#pairs = [
  ['(', ')'],
  ['[', ']']
]

# don't pick colors from current color scheme per plugin default
# use colors from VimClojure (see: vimclojure#ParenRainbowColorsDark)
g:rainbow#colors = { dark: [
                      ['yellow',  'orange1'     ],
                      ['green',   'yellow1'     ],
                      ['cyan',    'greenyellow' ],
                      ['magenta', 'green1'      ],
                      ['red',     'springgreen1'],
                      ['yellow',  'cyan1'       ],
                      ['green',   'slateblue1'  ],
                      ['cyan',    'magenta1'    ],
                      ['magenta', 'purple1'     ]
                    ],
                    light: [
                      ['darkyellow',  'orangered3'    ],
                      ['darkgreen',   'orange2'       ],
                      ['blue',        'yellow3'       ],
                      ['darkmagenta', 'olivedrab4'    ],
                      ['red',         'green4'        ],
                      ['darkyellow',  'paleturquoise3'],
                      ['darkgreen',   'deepskyblue4'  ],
                      ['blue',        'darkslateblue' ],
                      ['darkmagenta', 'darkviolet'    ]
                    ] }

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
