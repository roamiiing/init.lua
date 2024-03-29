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
	markdown = js_fmt,
}

return formatters
