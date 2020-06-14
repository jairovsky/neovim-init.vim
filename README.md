<center>
# Reduced version of Optixal's Neovim init.vim
</center>

### Main differences
* Easier installation.
* Removed dependency on python
* Removed most of the leader key mappings
* Removed extra themes
* Removed various plug-ins ~~that I judged unnecessary~~
* Added support for EditorConfig
* Added some sublime-textyness (ctrl-p, ctrl-d and ctrl-enter shortcuts)

### Install
```
bash -c "$(curl -sSL https://raw.githubusercontent.com/jairovsky/neovim-init.vim/master/install.sh)"
```
### Updating plugins

```
nvim
:PlugUpdate
```

(Optional) Clean plugins - Deletes unused plugins

```
nvim
:PlugClean
```

(Optional) Check, download and install the latest vim-plug

```
nvim
:PlugUpgrade
```

(Optional) Pull my updates if you want my new modifications

```sh
git pull
cp init.vim ~/.config/nvim/
```
### Mapped Commands in Normal Mode

Most custom commands expand off my map leader, keeping nvim as vanilla as possible.

* <kbd>,</kbd> - Map leader, nearly all my custom mappings starts with pressing the comma key
