# Diferences from [atweiden/pacfiles][atweiden/pacfiles] import

as of `49b4757d0d349f37089d8c7f924764649bdb99bc`

## Changes

### `.bashrc`

- Don't test for X11-related commands
  - `feh`
  - `pcmanfm`
  - `xautolock`
- Remove X11-related command aliases
  - `:o` (*pcmanfm*)
  - `xautolock-start` (*xautolock*)
- Replace test for X11-related commands
  - `feh` → `imv`
- Remove fallback to *ImageMagick* `display` for `VIEWER` environment
  variable
  - This breaks `.functions.d/qrshow.sh` when *imv* isn't installed

### `.config/gtk-3.0/settings.ini`

- Adopt settings from [sblumentritt/settei][sblumentritt/settei]

### `.config/tmux/tmux.conf`

- Change `bind -T copy-mode-vi y` to use `wl-copy` from *wl-clipboard*

### `.inputrc`

- enable [jumping between bash/readline prompts][foot prompt jumping]
  in foot
  - `vi-cmd-mode-string`
  - `vi-ins-mode-string`

### `.vim`

- Use [jasonccox/vim-wayland-clipboard][jasonccox/vim-wayland-clipboard]
  or similar to fix system clipboard support in wayland pending
  [#9639][#9639] (see also: [1][vim wayland clipboard i], [2][vim
  wayland clipboard ii], [3][vim wayland clipboard iii], [4][vim wayland
  clipboard iv])

### `.vim/config/base.vim`

- [enable native mouse support][enable native mouse support] for foot:
  `set ttymouse=sgr`
- [enable modifyOtherKeys level 2][enable modifyOtherKeys level 2]
  for foot (see also: [1][foot wiki ctrl+key breaks input in vim]):
  `set keyprotocol=foot:mok2`

## Removals

- `.Xmodmap`
- `.bin/conky-switcher`
- `.config/conky`
- `.config/dmenu`
- `.config/libfm`
- `.config/lxterminal`
- `.config/nitrogen`
- `.config/obmenu-generator`
- `.config/openbox`
- `.config/pcmanfm`
- `.config/picom`
- `.config/redshift`
- `.config/tint2`
- `.config/volumeicon`
- `.config/xfce4`
- `.xinitrc`


[atweiden/pacfiles]: https://github.com/atweiden/pacfiles
[sblumentritt/settei]: https://github.com/sblumentritt/settei
[foot prompt jumping]: https://codeberg.org/dnkl/foot/wiki#gnu-readline
[jasonccox/vim-wayland-clipboard]: https://github.com/jasonccox/vim-wayland-clipboard
[#9639]: https://github.com/vim/vim/pull/9639
[vim wayland clipboard i]: https://stackoverflow.com/questions/61379318/how-to-copy-from-vim-to-system-clipboard-using-wayland-and-without-compiled-vim/68598033#68598033
[vim wayland clipboard ii]: https://github.com/habamax/.vim/blob/master/plugin/wl_clipboard.vim
[vim wayland clipboard iii]: https://vi.stackexchange.com/questions/24792/how-to-automatically-perform-a-command-after-yanking-text-vim-wayland-clipboard/24798#24798
[vim wayland clipboard iv]: https://vi.stackexchange.com/questions/33138/how-to-copy-contents-of-wl-clipboard-into-a-vim-register
[enable native mouse support]: https://codeberg.org/dnkl/foot/wiki#vim
[enable modifyOtherKeys level 2]: https://github.com/vim/vim/issues/9014#issuecomment-1407471293
[foot wiki ctrl+key breaks input in vim]: https://codeberg.org/dnkl/foot/wiki#ctrl-key-breaks-input-in-vim
