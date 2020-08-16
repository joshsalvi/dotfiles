#!/bin/zsh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=/Users/jq210/Documents/GitHub/dotfiles/dotfiles             # dotfiles directory
olddir=/Users/jq210/Documents/GitHub/dotfiles/dotfiles_old      # old dotfiles backup directory
files=("zlogin" "bashrc" "vimrc" "zshrc" "zshenv")   # list of files/folders to symlink in homedir
echo "Will import the following files:"
echo $files
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done