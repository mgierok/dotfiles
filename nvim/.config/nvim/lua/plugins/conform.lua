return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		})
	end,
}
