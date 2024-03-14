return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("nvim-tree").setup({
			git = { enable = true },
			view = { width = 30 },
			renderer = {
				root_folder_label = false,
				full_name = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					webdev_colors = false,
					glyphs = {
						folder = {
							arrow_closed = ">",
							arrow_open = "v",
						},
						git = {
							untracked = "?",
							ignored = "i",
							staged = "s",
							unstaged = "u",
							renamed = "r",
							unmerged = "e",
							deleted = "d",
						},
					},
					show = { folder = false, git = true },
					git_placement = "signcolumn",
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { "^.git$", "^.idea$" },
			},
			update_focused_file = {
				enable = true,
			},
			ui = {
				confirm = {
					default_yes = true,
				},
			},
		})
	end,
}
