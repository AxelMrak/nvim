return {
  -- Mason: LSP package manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- mason-lspconfig: Integrates Mason with nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- List of LSP servers to install automatically
        ensure_installed = {
          "html",
          "biome",
        },
        automatic_installation = true,
      })
    end,
  },
  -- LSP Configuration (LazyVim/lazy.nvim style)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "stevearc/conform.nvim", -- Ensure conform is loaded
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- on_attach function: Defines keymaps and other settings when a server attaches to a buffer
      local on_attach = function(client, bufnr)
        -- Keymaps for LSP functionality
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "gr", vim.lsp.buf.references, "Go to References")
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>li", vim.lsp.buf.implementation, "Go to Implementation")
        map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
        map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>le", vim.diagnostic.open_float, "Show Line Diagnostics")

        -- The new conform.nvim plugin will handle formatting on save
      end

      -- Extended capabilities (e.g., for nvim-cmp)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Automatic handlers: Configure each installed server without manual calls
      mason_lspconfig.setup_handlers({
        -- Default handler for all servers
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}
