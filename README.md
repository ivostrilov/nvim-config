# Neovim config

## Lsp hints

Manual start for the current buffer:

```vim
<leader>ls
:LspStartCurrent
```

Useful LSP commands:

```vim
:checkhealth vim.lsp
:lsp enable <config_name>
:lsp stop [client_name]
:lsp restart [client_name]
:lsp disable <config_name>
```

Behavior notes:

- `:lsp enable <config_name>` enables auto-activation for current and future buffers.
- `:lsp stop` stops clients attached to the current buffer when no client name is provided.
- `:lsp restart` restarts clients attached to the current buffer when no client name is provided.
- `:lsp disable <config_name>` disables auto-activation and stops related clients.

Default LSP hotkeys in Neovim:

```text
K       hover docs
gra     code action
grn     rename
grr     references
gri     implementation
grt     type definition
grx     run codelens
gO      document symbols
gx      open document link
Ctrl-S  signature help in insert mode
Ctrl-]  go to definition via tagfunc/LSP
gq      format via formatexpr
```

Kotlin flow:

```vim
:MasonInstall kotlin-lsp
```

Open a `.kt` file in a Kotlin project, then run `<leader>ls`.

## Treesitter hints

Install parsers manually:

```vim
:TSInstall kotlin
```

Useful commands:

```vim
:TSInstall <language>
:TSUpdate
:TSInstallInfo
```

Kotlin Treesitter highlighting starts automatically for `.kt` files after the
`kotlin` parser is installed.
