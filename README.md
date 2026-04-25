# good-enough.nvim

The "Good enough" neovim config.

## What?

This is the most barebones neovim config I can tolerate, barely less than a 100 lines of code including comments. The goal is to have a config file that works and you can read in 30 minutes or less, depending as little as possible from third party plugins.

If I can do it natively (Or the CLI experience is "Good enough" e.g. Git and gh-cli), then I don't need a plugin.

## Why?

So after seeing how fragile the neovim plugin ecosystem is, I decided to re-do my config to depend as little as possible from plugins and still have a "Good enough" experience. Good enough is Good enough, not terrible, not bad, not excelent, but good enough. 

Also I just couldn't stop ricing the damn neovim config so this is also my attempt at being an adult and just stick with what is "Good enough". 

## How?

Just clone this repo in you .config folder, open nvim and let vim.pack and mason do their magic, then you should be good to go.

### External requirements

Before you clone, you need this installed in your machine:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md#installation)
- LSP Dependencies: `python`, `npm`, `nodejs`, `go`
- Clipboard tool (xclip/wl-clipboard/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/)

Then cone the repo like this:

```sh
git clone https://github.com/ajsandovalt/good-enough.nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## When?

I'll touch this basic config as little as possible, unless something breaks. I'm actively using this config so I should be quick at fixing issues. Issues and PRs are welcome.
