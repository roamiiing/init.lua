return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				numbers = "ordinal",
				number_style = "superscript",
				mappings = true,
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				offsets = {
					{
						filetype = "NvimTree",
						text = " ",
						highlight = "Directory",
						text_align = "left",
					},
				},
				show_buffer_icons = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				persist_buffer_sort = true,
				separator_style = { "", "" }, -- no separators
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "id",
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
					bufferline.style_preset.minimal,
				},
			},
		})
	end,
}
