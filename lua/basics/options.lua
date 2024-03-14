local M = {}

M.setup_color_scheme = function()
	vim.cmd([[colorscheme colibri]])
end

M.setup_globals = function()
	local g = vim.g
	local opt = vim.opt

	-- tabs
	opt.tabstop = 4

	-- true color support
	opt.termguicolors = true
	opt.background = "dark"

	-- set leader key
	g.mapleader = " "
	g.maplocalleader = " "

	-- enable Nerd Font
	g.have_nerd_font = true

	-- line numbers and relative line numbers
	opt.number = true
	opt.relativenumber = true

	-- use mouse
	opt.mouse = ""

	-- don't show mode, it's in the statusline
	opt.showmode = false

	-- do not use system clipboard. to use system clipboard, use "+ or "*
	opt.clipboard = ""

	-- auto indent on line break
	opt.breakindent = true

	-- ignore case when searching. Use \c to force case-sensitive
	opt.ignorecase = true
	opt.smartcase = true

	-- keep signcolumn always visible
	opt.signcolumn = "yes"

	-- decrease update time
	opt.updatetime = 250
	opt.timeoutlen = 300

	-- new splits position
	opt.splitbelow = true
	opt.splitright = true

	-- preview substitutions before applying
	opt.inccommand = "split"

	-- show which line is being edited
	opt.cursorline = true

	-- minimal number of screen lines to keep above and below the cursor
	opt.scrolloff = 10

	-- set highlight on search
	opt.hlsearch = true

	-- set statusline to global mode
	opt.laststatus = 3
end

return M
