local set_keymap = vim.keymap.set

local get_telescope_theme = function()
	return require("telescope.themes").get_ivy({})
end

local search_files = function()
	require("telescope.builtin").find_files(get_telescope_theme())
end

-- enter command mode with just ;
set_keymap("n", ";", ":")

set_keymap({ "i" }, "<C-K>", function()
	require("luasnip").expand()
end, { silent = true })

set_keymap({ "n", "i", "s" }, "<C-N>", function()
	require("luasnip").jump(1)
end, { silent = true })

set_keymap({ "n", "i", "s" }, "<C-P>", function()
	require("luasnip").jump(-1)
end, { silent = true })

set_keymap({ "n", "i", "s" }, "<C-E>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(1)
	end
end, { silent = true })

-- clear search highlight with <Esc>
set_keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move between buffers with <M-Tab> and <M-S-Tab>
set_keymap("n", "<M-Tab>", "<cmd>bn<CR>")
set_keymap("n", "<M-S-Tab>", "<cmd>bp<CR>")

-- on <Leader><Leader> go to next window. If there's only one
-- window, create a new one vertically splitted
local next_window_or_create = function()
	local count = vim.fn.winnr("$")

	if count == 1 then
		vim.cmd("vsplit")
	else
		vim.cmd("wincmd w")
	end
end

set_keymap("n", "<Leader><Leader>", next_window_or_create, {
	desc = "next window or new one",
})

-- code-mode (<Leader>c):
local diagnostic = vim.diagnostic

-- quick fix list
set_keymap("n", "<Leader>cq", diagnostic.setloclist, {
	desc = "<q>uick fix list",
})

-- error list
set_keymap("n", "<Leader>ce", diagnostic.setqflist, {
	desc = "<e>rror list",
})

-- next and previous diagnostic
set_keymap("n", "<Leader>cn", diagnostic.goto_next, {
	desc = "<n>ext diagnostic",
})
set_keymap("n", "<Leader>cp", diagnostic.goto_prev, {
	desc = "<p>revious diagnostic",
})

-- window-mode (<Leader>w):
set_keymap("n", "<Leader>w", "<C-w>", {
	desc = "<w>indow",
})

-- search-mode (<Leader>s):
-- search files
set_keymap("n", "<Leader>sf", search_files, { desc = "<f>iles" })

-- search buffers
local search_buffers = function()
	require("telescope.builtin").buffers(get_telescope_theme())
end
set_keymap("n", "<Leader>sb", search_buffers, { desc = "<b>uffers" })

-- search grep
local search_grep = function()
	require("telescope.builtin").live_grep(get_telescope_theme())
end
set_keymap("n", "<Leader>sg", search_grep, { desc = "<g>rep" })

-- search current string
local search_string = function()
	require("telescope.builtin").grep_string(get_telescope_theme())
end
set_keymap("n", "<Leader>ss", search_string, { desc = "<s>tring" })

-- search current buffer
local search_current_buffer = function()
	require("telescope.builtin").current_buffer_fuzzy_find(get_telescope_theme())
end
set_keymap("n", "<Leader>sc", search_current_buffer, { desc = "<c>urrent buffer" })

-- document-mode (<Leader>d):
-- format document
local format_document = function()
	require("conform").format()
end
set_keymap("n", "<Leader>df", format_document, { desc = "<f>ormat" })

-- save and format document
local save_and_format_document = function()
	format_document()
	vim.cmd("update")
end
set_keymap("n", "<Leader>ds", save_and_format_document, { desc = "<s>ave and format" })

-- explorer focus
set_keymap("n", "<Leader>e", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
	MiniFiles.reveal_cwd()
end, { desc = "<e>xplorer" })

-- buffer manipulation
-- close current buffer
local close_buffer = function()
	require("bufdelete").bufdelete(0, true)
end

set_keymap("n", "<Leader>x", close_buffer, {
	desc = "close buffer",
})

set_keymap("n", "<Leader>X", "<Cmd>BufferLineCloseOthers<CR>", {
	desc = "close other buffers",
})

-- go to buffer 1-9
for i = 1, 9 do
	set_keymap("n", "<Leader>" .. i, function()
		if MiniFiles then
			MiniFiles.close()
		end
		require("bufferline").go_to(i, true)
	end)
end

-- tab-mode (<Leader>t):
-- close tab
set_keymap("n", "<Leader>tx", "<cmd>tabclose<CR>", {
	desc = "close",
})

-- next, previous tabs
set_keymap("n", "<Leader>tn", "<cmd>tabnext<CR>", {
	desc = "<n>ext",
})

set_keymap("n", "<Leader>tp", "<cmd>tabprevious<CR>", {
	desc = "<p>revious",
})

-- open (new) tab
set_keymap("n", "<Leader>to", "<cmd>tabnew<CR>", {
	desc = "<o>pen",
})

-- git-mode (<Leader>g):
-- toggle blame line
set_keymap("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", {
	desc = "<b>lame",
})

-- preview current hunk inline
set_keymap("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>", {
	desc = "<p>review hunk",
})

-- reset current hunk
set_keymap("n", "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", {
	desc = "<r>eset hunk",
})

-- diff view
set_keymap("n", "<Leader>gd", "<cmd>DiffviewOpen<CR>", {
	desc = "<d>iff view",
})
