local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Delete buffers without closing windows
	"famiu/bufdelete.nvim",

	{
		"archseer/colibri.vim",
		config = require("basics.options").setup_color_scheme,
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	require("plugins.whichkey"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lspconfig"),
	require("plugins.cmp"),
	require("plugins.autopairs"),
	require("plugins.conform"),
	require("plugins.bufferline"),
	require("plugins.mini"),
	require("plugins.diffview"),
})
