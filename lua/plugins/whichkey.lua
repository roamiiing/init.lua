return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local whichkey = require("which-key")

		whichkey.setup({
			icons = {
				breadcrumb = ">",
				separator = "",
				group = "",
			},
			window = {
				winblend = 5,
				margin = { 1, 1, 2, 0.6 },
			},
		})

		local mappings = {
			["<leader>c"] = { name = "<c>ode", _ = "which_key_ignore" },
			["<leader>w"] = { name = "<w>indow", _ = "which_key_ignore" },
			["<leader>s"] = { name = "<s>earch", _ = "which_key_ignore" },
			["<leader>t"] = { name = "<t>ab", _ = "which_key_ignore" },
			["<leader>d"] = { name = "<d>ocument", _ = "which_key_ignore" },
			["<leader>g"] = { name = "<g>it", _ = "which_key_ignore" },
		}

		for i = 1, 9 do
			mappings["<leader>" .. i] = "which_key_ignore"
		end

		whichkey.register(mappings)
	end,
}
