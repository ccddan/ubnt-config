# Shell Config

```bash
$ cp .zshrc ~/
```

# Nodenv

```bash
$ curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash
$ mkdir -p "$(nodenv root)"/plugins
$ # git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build # NOTE: manually install this plugin if it is not installed by default
$ git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)"/plugins/nodenv-update
$
$ # Check nodenv installation/configuration status
$ curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
$
$ nodenv install 16.17.0
$ nodenv global 16.17.0
```

# Rust

```bash
$ # Install default configuration
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

# NeoVim

```bash
$ sudo apt-get install -y fuse libfuse2 git python3-pip ack-grep
$ mkdir -p ~/apps/neovim/
$ curl https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage -Lo ~/apps/neovim/nvim7.appimage
$ chmod +x ~/apps/neovim/nvim7.appimage
```

Once NeoVim is intalled, follow the configuration instructions at `nvim/README.md`.

