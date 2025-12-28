return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local map = vim.keymap.set

			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "ts_ls", "lua_ls", "basedpyright" },
			})

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				map("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
				map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				map("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
				map("n", "gr", vim.lsp.buf.references, opts) -- list references
				map("n", "K", vim.lsp.buf.hover, opts) -- docs popup

				map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- rename symbol
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code actions

				map("n", "[d", vim.diagnostic.goto_prev, opts) -- previous diagnostic
				map("n", "]d", vim.diagnostic.goto_next, opts) -- next diagnostic
			end

			vim.lsp.config("gopls", {
				on_attach = on_attach,
			})

			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
			})

			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
			})

			vim.lsp.config("basedpyright", {
				on_attach = on_attach,
				settings = {
					python = {},
				},
			})

			vim.lsp.enable("gopls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("basedpyright")
		end,
	},
}
