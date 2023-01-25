# configure clutter for wayland
export CLUTTER_BACKEND="wayland"

# configure firefox for wayland
export MOZ_ENABLE_WAYLAND=1

# configure gtk for wayland
export GDK_BACKEND="wayland"

# prevent waiting for xdg-desktop-portal (flatpak)
export GTK_USE_PORTAL=0

# make firefox aware of wayland instance when launched from x11
export MOZ_DBUS_REMOTE=1

# configure java applications for sway
export _JAVA_AWT_WM_NONREPARENTING=1

# configure qt for wayland/sway
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# configure sdl for wayland
export SDL_VIDEODRIVER="wayland"

# configure seatd
export LIBSEAT_BACKEND="seatd"

# configure xdg for wayland/sway
export DESKTOP_SESSION="sway"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_DESKTOP="sway"
export XDG_SESSION_TYPE="wayland"

[[ -r "$HOME/.bashrc" ]] \
  && source "$HOME/.bashrc"

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
