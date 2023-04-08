local core = require("user.core")
local plugins = require("user.plugins")


local on_attach = function(client, bufnr)
	core.keymaps.buffer.setup(bufnr)
	core.lsp.highlight_document(client)
	plugins.keymaps.buffer.setup(bufnr)
end


core.lsp.setup()
core.keymaps.global.setup()

plugins.packer.setup()
plugins.keymaps.global.setup()
local opts = plugins.make_opts(on_attach)
plugins.lsp.setup(opts)

vim.cmd[[silent! colorscheme deus]]

core.highlighting.setup()
plugins.setups.global.setup()
plugins.setups.buffer.setup(opts)
