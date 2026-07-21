# nvim config

Personal [AstroNvim v4](https://github.com/AstroNvim/AstroNvim) configuration.

## Installation

```shell
git clone https://github.com/danielannan17/nvim ~/.config/nvim
nvim
```

Requires Neovim, `git`, a [Nerd Font](https://www.nerdfonts.com/), and `ripgrep`.

## Key features and keymaps

### Claude Code ([claudecode.nvim](https://github.com/coder/claudecode.nvim))

Runs in a floating terminal, launched via a Docker sandbox.

| Keymap | Action |
| --- | --- |
| `<C-,>` | Focus Claude Code |
| `<leader>ac` | Toggle Claude Code |
| `<leader>ar` | Resume Claude Code |
| `<leader>aC` | Continue Claude Code |
| `<leader>am` | Select Claude model |
| `<leader>ab` | Add current buffer |
| `<leader>as` | Send visual selection / add file from tree |
| `<leader>aa` / `<leader>ad` | Accept / deny diff |

### LazyGit

| Keymap | Action |
| --- | --- |
| `<leader>lg` | Open LazyGit |

### Sidebar panels

Toggles a left-docked panel, closing whichever one is already open.

| Keymap | Action |
| --- | --- |
| `<leader>sf` | File explorer |
| `<leader>sg` | Git status |
| `<leader>sb` | Buffers |
| `<leader>ss` | Search and replace |
| `<leader>tt` | Toggleterm |

### Search and replace

| Keymap | Action |
| --- | --- |
| `<leader>fx` | VS Code-style search and replace |
| `<leader>fw` | Find words |
| `<leader>fW` | Find words in all files, including hidden/ignored |
| `<leader>gh` | Git file history |

### Motions ([flash.nvim](https://github.com/folke/flash.nvim))

| Keymap | Action |
| --- | --- |
| `s` | Flash jump |
| `S` | Flash treesitter jump |

### Linting

| Keymap | Action |
| --- | --- |
| `<leader>DD` | Run ESLint across the project with `--fix`, load results into diagnostics |
| `<leader>Df` | Run ESLint `--fix` on the current file |

### Core remaps

| Keymap | Action |
| --- | --- |
| `<C-s>` | Save |
| `<C-z>` (insert) | Smart undo |
| `<C-h/j/k/l>` (terminal) | Move focus between windows |
| `J` / `K` (visual) | Move selection down / up |
| `x` | Delete without yanking |
| `p` (visual) | Paste without overwriting the unnamed register |
