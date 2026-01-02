return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		require("nvim-treesitter").install({
			"go",
			"gomod",
			"lua",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"bash",
			"markdown",
			"markdown_inline",
			"python",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"go",
				"gomod",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"bash",
				"markdown",
				"markdown_inline",
			},
			callback = function(ev)
				vim.treesitter.start(ev.buf)
			end,
		})
	end,
}
