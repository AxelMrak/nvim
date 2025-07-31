return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
      map("n", "gr", vim.lsp.buf.references, "Show References")
      map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("n", "K", vim.lsp.buf.hover, "Show Documentation")
      map("n", "<leader>li", vim.lsp.buf.implementation, "Go to Implementation")
      map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
      map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>la", vim.lsp.buf.code_action, "Code Actions")
      map("n", "<leader>le", vim.diagnostic.open_float, "Show Line Diagnostics")

      if client.supports_method("textDocument/formatting") then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        -- Apply specific options for tsserver
        if server_name == "tsserver" then
          opts.init_options = {
            maxTsServerMemory = 8192,
            npmLocation = "npm",
            tsserver = {
              useSyntaxServer = "auto",
            },
          }
        end
        -- Configure the server
        lspconfig[server_name].setup(opts)
      end,
    })
  end,
}
