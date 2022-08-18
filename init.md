# Shell Config

```bash
$ cp .zshrc ~/
```

# NeoVim

```bash
$ sudo apt-get install -y fuse libfuse2 git python3-pip ack-grep
$ mkdir -p ~/apps/neovim/
$ curl https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage -Lo ~/apps/neovim/nvim7.appimage
$ chmod +x ~/apps/neovim/nvim7.appimage
```

Once NeoVim is intalled, follow the configuration instructions at `nvim/README.md`.
