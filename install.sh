#! /bin/bash

files=( ".zsh_addons" ".zshrc" ".nanorc" ".powerlevelrc" )
bins=( "editor" "nowplaying" )



mkdir -p $HOME/.dotfiles/bin $HOME/.dotfiles/backup

echo "Copying files..."
for file in ${files[@]}; do
  cp $file $HOME/.dotfiles/$file
  if [ ! -L $HOME/$file ]; then
    mv $HOME/$file $HOME/.dotfiles/backup/$file
  fi
  ln -s $HOME/.dotfiles/$file $HOME/$file
done

echo "Copying binaries..."
for bin in ${bins[@]}; do
  cp bin/$bin $HOME/.dotfiles/bin/$bin
  chmod +x $HOME/.dotfiles/bin/$bin
done

echo "Cloning and installing .nanorc files from github..."
git clone https://github.com/nanorc/nanorc nanofiles
cd nanofiles
make install
cd ..
rm -rf nanofiles

echo "Downloading antigen for zsh..."
curl -L git.io/antigen > antigen.zsh && mv antigen.zsh $HOME/.dotfiles/bin/antigen.zsh


echo "Installing dependencies..."
pip3 install pygments --user
wget -O $HOME/.dotfiles/bin/sp https://gist.githubusercontent.com/wandernauta/6800547/raw/2c2ad0f3849b1b1cd1116b80718d986f1c1e7966/sp
chmod +x $HOME/.dotfiles/bin/sp

echo "Done!"
echo "Existing files moved to $HOME/.dotfiles/backup"
