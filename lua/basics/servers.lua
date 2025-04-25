local lspconfig = require("lspconfig")

local servers = {
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
	ts_ls = {
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
		filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
		single_file_support = false,
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
					languages = { "vue" },
				},
			},
		},
	},
	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	},
	volar = {},
}

return servers
