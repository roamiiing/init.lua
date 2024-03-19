local tree_filter = function(entry)
	return entry.name ~= ".git" and entry.name ~= ".idea"
end

return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		require("mini.comment").setup()

		require("mini.move").setup()
		require("mini.files").setup({
			use_icons = vim.g.have_nerd_font,
			content = {
				filter = tree_filter,
				prefix = vim.g.have_nerd_font and require("mini.files").default_prefix or function() end,
			},
		})
		require("mini.statusline").setup({
			use_icons = vim.g.have_nerd_font,
		})

		vim.opt.laststatus = 3
	end,
}
