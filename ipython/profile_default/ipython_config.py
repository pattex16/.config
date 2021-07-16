c.TerminalInteractiveShell.editing_mode = 'vi'

import os
os.system("tmux rename-window ipy")
os.system("tmux set-window-option window-status-current-style 'fg=black bg=green'")
os.system("tmux set-window-option window-status-style 'fg=green'")
