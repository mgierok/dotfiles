return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    { "<leader><space>", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
    { "<leader>\\",      function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,    desc = "Grep" },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end,              desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                   desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,              desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,                 desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,                  desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,              desc = "Git Log File" },
    -- gh
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,           desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,          desc = "Goto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,            nowait = true,                       desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,       desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,      desc = "Goto T[y]pe Definition" },
    { "gai",        function() Snacks.picker.lsp_incoming_calls() end,        desc = "C[a]lls Incoming" },
    { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,        desc = "C[a]lls Outgoing" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,               desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,     desc = "LSP Workspace Symbols" },
    -- misc
    { "<leader>gg", function() Snacks.lazygit() end,                          desc = "Lazygit" },
    { "<c-/>",      function() Snacks.terminal() end,                         desc = "Toggle Terminal" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end,              desc = "Colorschemes" },
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
  },
}
