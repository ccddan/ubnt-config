# System Dependencies

- Python 3    (system wide/virtualenv)
- NodeJS ^16  (system wide/nvm)

# Configuration

## COC Plugins Manager

```bash
$ pip install neovim jedi
$ npm install --location=global neovim
```

## Fonts

```bash
$ mkdir -p ~/.local/share/fonts
$ curl -fLo ~/.local/share/fonts/"Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
$ sudo apt-get install -y fonts-powerline
```

## FZF

```bash
$ sudo apt-get install -y fd-find
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb && rm ripgrep_13.0.0_amd64.deb
```

## CTags

```bash
$ sudo apt-get update -y
$ sudo apt-get install -y \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
$ git clone https://github.com/universal-ctags/ctags.git --depth=1
$ cd ctags
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```

# Clipboard Support

**Ubuntu**: `sudo apt-get install -y xclip` (Disable win32yank clipboard support in init.vim file)

**WSL**:

```bash
$ mkdir ~/bin/
$ curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
$ unzip win32yank-x64.zip
$ chmod +x win32yank.exe
$ mv win32yank.exe ~/bin/
$ rm README.md LICENSE win32yank-x64.zip
```

NOTE: Clipboard support using win32yank.exe is enabled by default in init.vim file.

# Files

- `init.vim` --> `~/.config/nvim/`
- `coc-settings.json` --> `~/.config/nvim/`

Once you have copied these files, you can start neovim so all the plugins defined in the vim config file are installed (init.vim)

**IMPORTANT:** You might get multiple error when first running nvim. Usually at the second execution everything is installed correctly.
