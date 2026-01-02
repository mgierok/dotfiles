vim.cmd([[hi @lsp.type.number gui=italic]])

-- Colours
vim.opt.termguicolors = true

-- Wrtie file on make
vim.opt.autowrite = true

-- Text
vim.opt.wrap = false

-- Left margin
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- Bottom menu
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

-- Highlight current line
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Turn of swap files and backups
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.showtabline = 2

-- Floating windows
vim.opt.winborder = "rounded"

-- Search
vim.opt.ignorecase = true

-- Indents
vim.opt.smartindent = true

-- Persistent undo
vim.opt.undofile = true

-- Leader
vim.g.mapleader = " "

-- Habit Breaking
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<NOP>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<NOP>", { noremap = true })

-- Clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d')
vim.opt.mouse = ""

vim.pack.add({
  { src = "https://github.com/jnurmine/Zenburn" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.splitjoin" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/saghen/blink.cmp",                version = "*" },
})

vim.cmd.colorscheme("zenburn")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'lua', 'typescript', 'javascript', 'go', 'rust', 'python' },
  callback = function() vim.treesitter.start() end,
})

vim.lsp.enable({
  "lua_ls", "cssls", "rust_analyzer", "tailwindcss", "ts_ls", "gopls", "pyright"
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

local prettier_ft = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  css = true,
  html = true,
  json = true,
  jsonc = true,
  markdown = true,
  yaml = true,
}

local function format_with_prettier()
  vim.cmd("silent! keepjumps %!prettier --stdin-filepath %")
end

local function format_buffer()
  local ft = vim.bo.filetype

  if prettier_ft[ft] and vim.fn.executable("prettier") == 1 then
    format_with_prettier()
    return
  end

  -- fallback: LSP
  vim.lsp.buf.format({ async = false })
end

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = format_buffer,
})
vim.keymap.set({ "n", "v", "x" }, "<leader>lf", function()
  format_buffer()
end, { desc = "Format current buffer" })

require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua"
  },
  keymap = {
    preset = "enter",
  },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
})

require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.pick").setup()

local pick = require("mini.pick")
vim.keymap.set("n", "<leader>ff", function() pick.builtin.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", function() pick.builtin.buffers() end, { desc = "Pick buffer" })
vim.keymap.set("n", "<leader>fg", function() pick.builtin.grep_live() end, { desc = "Grep files" })

require("oil").setup({
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = true,
  },
  columns = {
    "icon",
  },
  float = {
    max_width = 0.3,
    max_height = 0.6,
    border = "rounded",
  },
})
