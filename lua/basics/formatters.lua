local js_fmt = { "prettier" }

local formatters = {
	lua = { "stylua" },
	go = { "goimports", "gofmt" },
	javascript = js_fmt,
	javascriptreact = js_fmt,
	typescript = js_fmt,
	typescriptreact = js_fmt,
	vue = js_fmt,
	graphql = js_fmt,
	yaml = js_fmt,
	toml = { "taplo" },
	markdown = js_fmt,
	css = js_fmt,
	prisma = js_fmt,
	json = js_fmt,
}

return formatters
