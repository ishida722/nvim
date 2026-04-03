return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown" },
		opts = {},
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown" },
	},
	{
		"preservim/vim-markdown",
		dependencies = { "godlygeek/tabular" },
		ft = { "markdown" },
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install && git restore .",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },
	},
	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
	},
}
