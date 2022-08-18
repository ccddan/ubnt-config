# System Dependencies

- Python 3    (system wide/virtualenv)
- NodeJS ^16  (system wide/nvm)

# Configuration

## COC Plugins Manager

```bash
$ pip install neovim
$ npm install --location=global neovim
```

## Fonts

```bash
$ mkdir -p ~/.local/share/fonts
$ curl -fLo ~/.local/share/fonts/"Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

# Files

- `init.vim` --> `~/.config/nvim/`
- `coc-settings.json` --> `~/.config/nvim/`

Once you have copied these files, you can start neovim so all the plugins defined in the vim config file are installed (init.vim)

**IMPORTANT:** You might get multiple error when first running nvim. Usually at the second execution everything is installed correctly.
