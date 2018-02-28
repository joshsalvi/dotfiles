#!/usr/bin/env zsh
files=( ".zsh_addons" ".zshrc" ".nanorc" ".powerlevelrc" )
bins=( "editor" "nowplaying" "github_issues" "itunes-track" )
completions=( "_venv" )
scripts=( ".autoenv.zsh" ".autoenv_leave.zsh" )


mkdir -p $HOME/.dotfiles/bin $HOME/.dotfiles/backup $HOME/.dotfiles/.comp $HOME/.dotfiles/scripts

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

echo "Copying completions..."
for completion in ${completions[@]}; do
    cp .comp/$completion $HOME/.dotfiles/.comp/$completion
    chmod +x $HOME/.dotfiles/.comp/$completion
done

echo "Copying scripts..."
for script in ${scripts[@]}; do
    cp scripts/$script $HOME/.dotfiles/scripts/$script
    chmod +x $HOME/.dotfiles/scripts/$script
done
