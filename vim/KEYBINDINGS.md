# Neovim Keybindings Cheat Sheet

> Leader key is `\` (default).
> Config: `~/.config/nvim/` (Lua, managed by lazy.nvim).

---

## Navigation & Editor

| Mode | Key | Action | Source |
|------|-----|--------|--------|
| `n` | `<Tab>` | Next tab | bufferline |
| `n` | `<S-Tab>` | Previous tab | bufferline |
| `n` | `<C-n>` / `<leader>e` | Toggle file explorer | neo-tree |
| `n` | `<Esc>` | Clear search highlight | core |
| `n`, `x` | `ga` | EasyAlign | vim-easy-align |

---

## LSP — Go To / Navigation

> Buffer-local; active only when a language server attaches.

| Mode | Key | Action | Source |
|------|-----|--------|--------|
| `n` | `gd` | Go to definition | native |
| `n` | `gD` | Go to declaration | native |
| `n` | `gi` | Go to implementation | native |
| `n` | `gr` | Find references (picker) | Telescope |
| `n` | `gp` | Peek definition (preview window) | glance.nvim |
| `n` | `K` | Hover documentation | native |
| `n`, `i` | `<C-k>` | Signature help | native |
| `n` | `<space>D` | Go to type definition | native |

---

## LSP — Diagnostics

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<C-j>` | Jump to next diagnostic |
| `n` | `[d` | Jump to previous diagnostic (with float) |
| `n` | `]d` | Jump to next diagnostic (with float) |
| `n` | `gl` | Show line diagnostics (float) |
| `n` | `<space>e` | Open diagnostic float |
| `n` | `<space>q` | Send diagnostics to location list |

---

## LSP — Code Actions & Refactoring

| Mode | Key | Action |
|------|-----|--------|
| `n`, `v` | `<leader>a` | Code action |
| `n`, `v` | `<leader>rn` | Rename symbol |
| `n` | `<C-S-p>` | Organize TypeScript imports |

---

## LSP — Workspace Folders

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<space>wa` | Add workspace folder |
| `n` | `<space>wr` | Remove workspace folder |
| `n` | `<space>wl` | List workspace folders |

---

## Completion (blink.cmp)

| Mode | Key | Action |
|------|-----|--------|
| `i` | `<C-Space>` | Trigger completion / toggle docs |
| `i` | `<C-n>` / `<Down>` | Select next item |
| `i` | `<C-p>` / `<Up>` | Select previous item |
| `i` | `<C-d>` | Scroll docs up |
| `i` | `<C-f>` | Scroll docs down |
| `i` | `<C-e>` | Hide completion menu |
| `i` | `<CR>` | Confirm selected item |

---

## Snippets (LuaSnip)

| Mode | Key | Action |
|------|-----|--------|
| `i` | `<C-K>` | Expand snippet |
| `i`, `s` | `<C-L>` | Jump to next placeholder |
| `i`, `s` | `<C-J>` | Jump to previous placeholder |
| `i`, `s` | `<C-E>` | Cycle through snippet choices |

---

## Telescope (Fuzzy Finder)

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>gf` | Search Git files |
| `n` | `<leader>bf` | Show open buffers |

---

## Debugging (DAP)

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<leader>db` | Toggle breakpoint |
| `n` | `<leader>dc` | Continue execution |
| `n` | `<leader>dr` | Toggle debug REPL |
| `n` | `<leader>dt` | Toggle DAP UI |
