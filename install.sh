
#curl antigen

files=( ".zsh_addons" ".zshrc" ".nanorc")
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
curl -L git.io/antigen > antigen.zsh
mv antigen.zsh $HOME/.dotfiles/bin/antigen.zsh


echo "Installing dependencies..."
pip3 install pygments

if [ "$(uname)" == "Darwin" ]; then
 $powerlevelfile=".powerlevelrc_osx"
else
	$powerlevelfile=".powerlevelrc"
fi

	cp $powerlevelfile $HOME/.dotfiles/.powerlevelrc
	if [ ! -L $HOME/$file ]; then
		mv $HOME/.powerlevelrc $HOME/.dotfiles/backup/.powerlevelrc
	fi
	ln -s $HOME/.dotfiles/.powerlevelrc $HOME/.powerlevelrc

rm -rf tmp
echo "Done!"
echo "Existing files moved to $HOME/.dotfiles/backup"
