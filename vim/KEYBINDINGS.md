# Neovim Keybindings Cheat Sheet

> Leader key is `\` (default) unless remapped.

---

## Navigation & Buffers

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<Tab>` | Next tab/buffer |
| `n` | `<S-Tab>` | Previous tab/buffer |

---

## LSP — Go To / Navigation

> These are buffer-local and only active when an LSP attaches.

| Mode | Key | Action | Source |
|------|-----|--------|--------|
| `n` | `gd` | Go to definition | lspsaga |
| `n` | `gD` | Go to declaration | lspconfig |
| `n` | `gi` | Go to implementation | lspconfig |
| `n` | `gr` | Find references (finder) | lspsaga |
| `n` | `gp` | Peek definition (inline preview) | lspsaga |
| `n` | `K` | Hover documentation | lspsaga |
| `n` | `<C-k>` | Signature help (normal mode) | lspconfig |
| `i` | `<C-k>` | Signature help (insert mode) | lspsaga |
| `n` | `<space>D` | Go to type definition | lspconfig |

---

## LSP — Diagnostics

| Mode | Key | Action |
|------|-----|--------|
| `n` | `<C-j>` | Jump to next diagnostic (lspsaga) |
| `n` | `gl` | Show line diagnostics |
| `n` | `[d` | Jump to previous diagnostic (with float) |
| `n` | `]d` | Jump to next diagnostic (with float) |
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

## Completion (nvim-cmp)

| Mode | Key | Action |
|------|-----|--------|
| `i` | `<C-Space>` | Trigger completion |
| `i` | `<C-d>` | Scroll docs up |
| `i` | `<C-f>` | Scroll docs down |
| `i` | `<C-e>` | Close completion menu |
| `i` | `<CR>` | Confirm selected completion item |

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

---

## Perl (perltidy)

| Mode | Key | Action |
|------|-----|--------|
| `n` | `tt` | Run perltidy on entire buffer |
| `v` | `tt` | Run perltidy on selection |
