<h1 align="center">
Reduced version of Optixal's Neovim init.vim
</h1>

![Tilix: Default_005](https://user-images.githubusercontent.com/1995580/84717487-53693300-af4c-11ea-9037-9528aa8c6475.png)


### Main differences
* Easier installation
* Removed dependency on python
* Removed most of the leader key mappings
* Removed extra themes
* Removed various plugins ~~that I judged unnecessary~~
* Added support for EditorConfig
* Added some sublime-textyness

The purpose is to make neovim usable right away, with file search (by name and by content), good syntax highlight support and a color scheme that is not perfect but behaves well across many programming languages.

### Install
```
bash -c "$(curl -sSL https://raw.githubusercontent.com/jairovsky/neovim-init.vim/master/install.sh)"
```
### Updating plugins
Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).

### Mapped commands
* <kbd>,</kbd><kbd>f</kbd> opens fzf search by file content (ripgrep must be installed)
* <kbd>,</kbd><kbd>y</kbd> copies the entire buffer to clipboard
* <kbd>Ctrl</kbd><kbd>P</kbd> opens fzf search by file name
* <kbd>Ctrl</kbd><kbd>D</kbd> starts multiple word selection (similar to Sublime Text)
* <kbd>Ctrl</kbd><kbd>Enter</kbd> selects all words in the buffer that match the current selection (similar to Sublime Text)
