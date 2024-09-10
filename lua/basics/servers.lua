local lspconfig = require("lspconfig")

local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
	--
	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim
	--
	-- But for many setups, the LSP (`tsserver`) will work just fine
	-- tsserver = {},
	--

	lua_ls = {
		-- cmd = {...},
		-- filetypes { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
	gopls = {
		root_dir = lspconfig.util.root_pattern("go.mod"),

		-- See https://github.com/golang/tools/blob/master/gopls/doc/settings.md
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
	},
	yamlls = {
		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
			},
		},
	},
	rust_analyzer = {},
	pyright = {},
	marksman = {},
	tsserver = {
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
		single_file_support = false,
	},
	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	},
}

return servers
