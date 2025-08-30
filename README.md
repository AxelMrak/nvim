# Neovim Config (LazyVim-based)

Opinionated Neovim setup built on top of LazyVim and managed with `lazy.nvim`.
It includes sensible defaults, LSP, treesitter, Telescope, Git integration, and
editor UX enhancements. This repo is used standalone or as a submodule of my
`dotfiles`.

## Requirements
- Neovim >= 0.9
- A Nerd Font (for icons), e.g. FiraCode Nerd Font
- CLI tools: `git`, `ripgrep` (`rg`), `fd`, `fzf`
- Recommended: `node` (for some LSPs), `python3` + `pip`, `cargo` (optional)

## Install
You can use this configuration in two ways.

1) With my dotfiles (recommended)
- Clone the dotfiles with submodules:
  `git clone --recursive https://github.com/AxelMrak/dotfiles.git`
- Create symlinks using GNU Stow from the dotfiles repo:
  `bash scripts/bootstrap.sh nvim`
- Launch Neovim: `nvim` (plugins will auto-install via `lazy.nvim`).

2) Standalone
- Backup your current config: `mv ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d)`
- Clone this repo: `git clone https://github.com/AxelMrak/nvim.git ~/.config/nvim`
- Start Neovim: `nvim`

## Structure
- `init.lua`: boots LazyVim and loads user modules
- `lua/config/`: core settings
  - `lazy.lua`: bootstraps `lazy.nvim` and sets up the plugin spec
  - `options.lua`, `keymaps.lua`, `autocmds.lua`: editor behavior and shortcuts
- `lua/plugins/*.lua`: plugin specs and per-plugin config
- `lazy-lock.json`: plugin lockfile (exact versions)
- `mcpservers.json`: optional MCP Hub integration settings

## Key Plugins
- LazyVim core + `lazy.nvim` for plugin management
- Telescope (fuzzy finding), Treesitter (better syntax), LSP + Mason (language servers)
- Git signs, which-key, todo-comments, formatter, NvimTree (file explorer)

## Common Tasks
- Update plugins: `:Lazy sync` or `:Lazy update`
- Check health: `:checkhealth`
- Find files: `<leader>ff` (Telescope)
- Open file tree: `<leader>e` (NvimTree)
- Toggle diagnostics list: `<leader>xx` (trouble/todo if configured)

## Tips
- If the UI looks off, ensure a Nerd Font is active in your terminal.
- If LSPs are missing, open `:Mason` and install the ones you need.
- For first run issues, try `:Lazy sync` then restart Neovim.

## License
See `LICENSE` for details.
