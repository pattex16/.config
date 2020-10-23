#!/bin/zsh
export PATH=$PATH:$HOME/.local/share/cargo/bin:$HOME/.local/bin

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESSHISTFILE="$HOME/.cache/less/less.hist"

export RUSTUP_HOME="$HOME/.config/rustup"
export GNUPGHOME="$HOME/.config/gnupg"
export WINEPREFIX="$HOME/.local/wine"
export WGETRC="$HOME/.config/wget/wgetrc"
export CARGO_HOME="$HOME/.local/share/cargo"
export ANDROID_SDK_HOME="$HOME/.local/share/android"
export ANDROID_AVD_HOME="$HOME/.local/share/android"
export ANDROID_EMULATOR_HOME="$HOME/.local/share/android"
export ANDROID_VENDOR_KEY="$HOME/.local/share/android"
export ERRFILE="$HOME/.cache/xorg/xsession-errors"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"
export HISTFILE="$HOME/.cache/bash/bash.hist"
export ICEAUTHORITY="$HOME/.cache/libice/iceauthority"
export XAUTHORITY="$HOME/.config/xorg/xauthority"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/settings.ini" 
export IPYTHONDIR="$HOME/.config/ipython"

export INTLTOOL_PERL=perl
export DISPLAY=":1"
