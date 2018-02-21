# dotfiles
Just my dotfiles for zsh with a little install script to install os specific powerlevel9k stuff

Automatically installs:
- [antigen for zsh](https://github.com/zsh-users/antigen) 
- `python-pygments` via apt
- `sp` if using Linux for adding Spotify to the [custom_now_playing](https://github.com/bhilburn/powerlevel9k/wiki/User-Segments#current-itunesosx--spotifyubuntu-track) segment 
- `nodejs`, `npm`, `nvm` and the packages `commitizen`, `ncu` and `semantic-release`
.zshrc also installs parts from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and the [powerlevel9k theme](https://github.com/bhilburn/powerlevel9k) 
(Disclaimer, as of 2/21/18, powerlevel9k is installed from my personal fork [here on github](https://github.com/sambadevi/powerlevel9k))

I recommend the oceanic theme preset from [materialshell](https://github.com/carloscuesta/materialshell) for Terminal.app on OSX
