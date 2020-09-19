if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx ~/.config/xorg/xinitrc
fi

export PATH="/home/selz/.local/share/cargo/bin:$PATH"
