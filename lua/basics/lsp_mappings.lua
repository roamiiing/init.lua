-- these are mappings that are specific to the LSP

local M = {}

M.setup = function(event)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
	end

	local builtin = require("telescope.builtin")
	local get_telescope_theme = function()
		return require("telescope.themes").get_ivy({})
	end

	map("gd", builtin.lsp_definitions, "<g>oto <d>efinition")
	map("gD", vim.lsp.buf.declaration, "<D>eclaration")
	map("gr", builtin.lsp_references, "<g>oto <r>eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "<g>oto <i>mplementation")

	map("<leader>cd", builtin.lsp_type_definitions, "<d>efinition")
	map("<leader>cs", function()
		builtin.lsp_document_symbols(get_telescope_theme())
	end, "<s>ymbols")
	map("<leader>cf", function()
		builtin.lsp_dynamic_workspace_symbols(get_telescope_theme())
	end, "<f>uzzy symbols")
	map("<leader>cr", vim.lsp.buf.rename, "<r>ename")
	map("<leader>ca", vim.lsp.buf.code_action, "<a>ction")

	map("K", vim.lsp.buf.hover, "Hover Documentation")
end

return M
