local M = {}

local SESSIONS_DIR = vim.env.HOME .. "/.nvim-sessions"

local get_session_path = function()
	local cwd = vim.fn.getcwd()
	cwd = cwd:gsub("/", "++")

	return SESSIONS_DIR .. "/" .. cwd .. ".vim"
end

local save_session_raw = function()
	vim.cmd("mksession! " .. get_session_path())
end

local save_session = function()
	vim.cmd("DiffviewClose")
	vim.cmd("DBUIClose")

	save_session_raw()
end

local restore_session = function()
	local path = get_session_path()

	if vim.fn.filereadable(path) == 0 then
		return
	end

	vim.cmd("source " .. path)
end

local setup_autosession = function()
	if vim.fn.argv(0) ~= "" then
		return
	end

	vim.opt.sessionoptions = "buffers,tabpages,winsize,terminal,folds"
	vim.fn.mkdir(SESSIONS_DIR, "p")

	vim.api.nvim_create_autocmd({
		"VimLeavePre",
	}, {
		callback = save_session,
	})

	restore_session()
end

M.setup = setup_autosession
M.save = save_session
M.save_raw = save_session_raw
M.restore = restore_session

return M
