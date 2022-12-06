local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

-- DIAGNOSTICS CONFIG
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(client)  
  lsp_highlight_document(client)
  -- LSP BUF CONFIGS
  --[[ Buffer 0 means the current buffer ]]
  local bufopts = {buffer = 0}
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>p', vim.lsp.buf.formatting , bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

end

-- Native LSP
-- 1 -  get the LSP 
-- 2 - Tell neovim i would like to use that
--
--[[ GO PLEASE SERVER: go install golang.org/x/gopls@latest ]]
--If you run gopls it will start the server
-- One of the most important properties is the on_attach... that will run some code for when the LSP attach to the buffer.. thats a good place to configure the kemaps that will only work when the LSP is active
--
require'lspconfig'.gopls.setup{
  on_attach = on_attach 
}

require'lspconfig'.tsserver.setup{
  on_attach = on_attach
}
require'lspconfig'.dartls.setup{
  on_attach = on_attach
}

require'lspconfig'.sumneko_lua.setup{}


