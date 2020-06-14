#!/bin/bash -e

command -v nvim || {
    read -p "neovim not found in your PATH. Do you want to install? (y/N): "
    echo
    echo

    if [ "$REPLY" = "y" ]; then
        echo "| IMPORTANT:"
        echo "| i'm gonna need root access for that."
        echo "| if you are ok with it type your password below:"
        echo
        sudo curl -L "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage" --output /usr/bin/nvim;
        sudo chmod +x /usr/bin/nvim
    else
        exit 1
    fi

}

echo '[*] Preparing Neovim config directory ...'
if [$XDG_CONFIG_HOME = ""]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi
mkdir -p "$XDG_CONFIG_HOME/nvim"

if [ -e "$XDG_CONFIG_HOME/nvim/init.vim" ]; then
    echo '[*] Backing up existent configuration ...'
    cp $XDG_CONFIG_HOME/nvim/init.vim $XDG_CONFIG_HOME/nvim/init.vim.old
fi

echo '[*] Preparing vim-plug ...'
if [$XDG_DATA_HOME = ""]; then
    XDG_DATA_HOME="$HOME/.local/share"
fi
curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo /tmp/jairovsky-init.vim --create-dirs https://raw.githubusercontent.com/jairovsky/neovim-init.vim/master/init.vim

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' /tmp/jairovsky-init.vim > $XDG_CONFIG_HOME/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim
cp /tmp/jairovsky-init.vim $XDG_CONFIG_HOME/nvim/
touch $XDG_CONFIG_HOME/nvim/custom.vim

echo -e "[+] Done, welcome to \033[1m\033[92mNeoVim\033[0m! Try it by running: nvim/vim. Want to customize it? Modify $XDG_CONFIG_HOME/nvim/custom.vim"
