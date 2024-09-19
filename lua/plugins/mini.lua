local tree_filter = function(entry)
	return entry.name ~= ".git" and entry.name ~= ".idea"
end

return {
	"echasnovski/mini.nvim",
	version = false,
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
			mappings = {
				close = "<Esc>",
				go_in = "L",
				go_out = "H",
				go_in_plus = "<CR>",
				go_out_plus = "<BS>",
			},
		})

		require("mini.statusline").setup({
			use_icons = vim.g.have_nerd_font,
		})
		vim.opt.laststatus = 3

		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				{ mode = "n", keys = "<Leader>c", desc = "<c>ode" },
				{ mode = "n", keys = "<Leader>d", desc = "<d>ocument" },
				{ mode = "n", keys = "<Leader>g", desc = "<g>it" },
				{ mode = "n", keys = "<Leader>s", desc = "<s>earch" },
				{ mode = "n", keys = "<Leader>t", desc = "<t>ab" },

				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},

			window = {
				delay = 0,
			},
		})
	end,
}
