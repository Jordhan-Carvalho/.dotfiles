local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("problem on the init.lua of LSP")
	return
end

require("jpconfig.lsp.lsp-installer")
require("jpconfig.lsp.handlers").setup()
require "jpconfig.lsp.null-ls"
