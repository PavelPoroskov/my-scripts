if ! grep -q file:///home/$USER/Pictures/Screenshots  ~/.config/gtk-3.0/bookmarks; then
  echo file:///home/$USER/Pictures/Screenshots >> ~/.config/gtk-3.0/bookmarks
fi

if ! grep -q file:///home/$USER/Pictures/Screenshots  ~/.config/gtk-3.0/bookmarks; then
  echo file:///home/$USER/Pictures/Screenshots >> ~/.config/gtk-3.0/bookmarks
fi

if [ ! -d ~/.tmp ]; then
  mkdir -p ~/.tmp
fi

if ! grep -q file:///home/$USER/.tmp  ~/.config/gtk-3.0/bookmarks; then
  echo file:///home/$USER/.tmp TMP >> ~/.config/gtk-3.0/bookmarks
fi

#  env | sort > ~/bashrc-env.txt
if [ -z $VSCODE_PID ]; then
  rm -rf ~/.tmp/*
fi

if [ ! -d ~/Documents/TMP-MANUAL ]; then
  mkdir -p ~/Documents/TMP-MANUAL
fi

if ! grep -q file:///home/$USER/Documents/TMP-MANUAL  ~/.config/gtk-3.0/bookmarks; then
  echo file:///home/$USER/Documents/TMP-MANUAL >> ~/.config/gtk-3.0/bookmarks
fi

# SAVE_DIR="/home/$USER/afolder/_save/$(date +%Y-%m)-01"
# mkdir -p $SAVE_DIR

# if [ -h ~/SAVE ]; then
#   unlink ~/SAVE
# fi
# ln -s $SAVE_DIR ~/SAVE

# if ! grep -q file:///home/$USER/SAVE  ~/.config/gtk-3.0/bookmarks; then
#   echo file:///home/$USER/SAVE >> ~/.config/gtk-3.0/bookmarks
# fi