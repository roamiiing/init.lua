local set_keymap = vim.keymap.set

-- enter command mode with just ;
set_keymap("n", ";", ":")

-- disable arrow keys
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	set_keymap("n", key, "<Nop>")
end

-- clear search highlight with <Esc>
set_keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move between buffers with <Tab> and <S-Tab>
set_keymap("n", "<Tab>", "<cmd>bn<CR>")
set_keymap("n", "<S-Tab>", "<cmd>bp<CR>")

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
set_keymap("n", "<Leader>w", "<C-w>")

-- search-mode (<Leader>s):
local get_telescope_theme = function()
	return require("telescope.themes").get_ivy({})
end

-- search files
local search_files = function()
	require("telescope.builtin").find_files(get_telescope_theme())
end
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
set_keymap("n", "<Leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "<e>xplorer" })

-- buffer manipulation
-- close current buffer
local close_buffer = function()
	require("bufdelete").bufdelete(0, true)
end

set_keymap("n", "<Leader>x", close_buffer, {
	desc = "close buffer",
})

-- go to buffer 1-9
for i = 1, 9 do
	set_keymap("n", "<Leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>")
end
