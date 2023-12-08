local M = {}

local config = require('user.plugins.config')
local packager = require('user.plugins.packager')
local keymaps = require('user.plugins.keymaps')


M.on_attach = function(client, bufnr)
	keymaps.on_attach(client, bufnr)
end


M.setup = function()
	packager.setup()
	keymaps.setup()
end


M.attach = function(on_attach)
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local opts = {
		capabilities = capabilities,
		on_attach = on_attach
	}

	config.mason(opts)
	config.standalone(opts)
end


return M
