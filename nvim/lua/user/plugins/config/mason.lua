local M = {}

local utils = require('user.utils')

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")


local autocmd = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {"mason", "lsp-installer", "lspinfo"},
		callback = function()
			vim.api.nvim_win_set_config(0, { border = "rounded" })
		end,
	})
end


M.setup = function(config, opts)
	autocmd()
	mason.setup()
	mason_lspconfig.setup()

	local servers = mason_lspconfig.get_installed_servers()

	for _, server in ipairs(servers) do
		-- leave `rust_analyzer` for `rust_tools`
		if server == 'rust_analyzer' then
		else

			local final = deep_merge('force', opts, config[server] or {})

			lspconfig[server].setup(final)
		end
	end
end

return M