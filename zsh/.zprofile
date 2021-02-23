# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx ~/.config/xorg/xinitrc
# fi


export PATH=$PATH:$HOME/.local/share/cargo/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.7.0/bin/:$HOME/.local/share/npm/bin:$HOME/.local/bin/script
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="/home/selz/.local/share/cargo/bin:$PATH"
export QT_STYLE_OVERRIDE=kvantum
export WINEPREFIX="$HOME/.local/wine"
export _JAVA_AWT_WM_NONREPARENTING=1
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/settings.ini"
