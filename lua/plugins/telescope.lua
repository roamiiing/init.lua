return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"__snapshots__/",
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
	end,
}
