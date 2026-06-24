# Neovim Config (LazyVim)

LazyVim distribution on lazy.nvim. Java-focused setup with Maven tooling, DAP, neotest, and OpenCode AI integration.

## Structure

- `init.lua` -> `lua/config/lazy.lua` (bootstrap)
- `lua/config/` - core options, keymaps, autocmds (currently minimal; relies on LazyVim defaults)
- `lua/plugins/` - individual plugin spec files, auto-loaded by lazy.nvim
- `plugin/after/` - post-load scripts (transparency)
- `lazyvim.json` - LazyVim extras manifest

## LazyVim Extras (from `lazyvim.json`)

Coding: luasnip. DAP: core. Editor: aerial, harpoon2, neo-tree, navic, overseer, refactoring.
Language: angular, docker, java, markdown, sql.

## Conventions

- **Lua style**: 2-space indent, 120 column width (`stylua.toml`)
- **Plugin specs**: return a table (or array of tables) per file in `lua/plugins/`
- **No custom keymaps/autocmds yet**: `lua/config/keymaps.lua` and `autocmds.lua` are empty stubs
- **Absolute line numbers only**: `relativenumber = false` in `lua/config/options.lua`

## Java Setup

- **Formatter**: google-java-format with `--aosp` flag (4-space indent, tabs expanded)
- **LSP**: JDTLS via `lazyvim.plugins.extras.lang.java`
- **Testing**: neotest with `neotest-java` adapter (requires nvim-jdtls)
- **Auto-save**: 10s debounce, Java files only, on InsertLeave/TextChanged

## Maven Keymaps (`<leader>M` prefix)

| Key | Command |
|-----|---------|
| `<leader>Mb` | `mvn clean compile` |
| `<leader>Mi` | `mvn clean install` |
| `<leader>Mt` | `mvn test` |
| `<leader>Ms` | Single test (prompts for class/method) |
| `<leader>Mp` | `mvn clean package -DskipTests` |
| `<leader>Mc` | `mvn clean` |
| `<leader>Md` | `mvn dependency:tree` |
| `<leader>Mx` | Custom command (prompts) |

All Maven commands run in toggleterm float windows (curved border, `q` to close).

## Theme System

- **Active**: tokyonight-night (`lua/plugins/theme.lua`)
- **Transparency**: `plugin/after/transparency.lua` strips bg from 30+ highlight groups (Normal, floats, NeoTree, NvimTree, Notify, etc.)
- **Hot-reload**: `lua/plugins/omarchy-theme-hotreload.lua` listens for `LazyReload` event, unloads/reloads theme, re-applies transparency
- **14 extra themes** pre-installed in `lua/plugins/all-themes.lua` (lazy-loaded)

## Other Keymaps

- `<leader>Bb` - Toggle Bruno API client (float terminal)
- `<leader>Oa` - OpenCode: ask about selection
- `<leader>Os` - OpenCode: select mode
- `go` / `goo` - OpenCode operator (append range/line to prompt)
- `<S-C-u>` / `<S-C-d>` - OpenCode scroll session

## Gotchas

- `noice.nvim` has a treesitter patch in `lua/plugins/noice-fix.lua` to suppress invalid query errors
- `snacks.nvim` scroll animations are disabled (`lua/plugins/snacks-animated-scrolling-off.lua`)
- LazyVim news alerts are disabled (`lua/plugins/disable-news-alert.lua`)
- `lua/plugins/example.lua` exists but is a disabled template (early `return`)
- DAP UI: wrapping enabled, force_buffers disabled
- Neoconf/neodev enabled with plugin library support for lua_ls
