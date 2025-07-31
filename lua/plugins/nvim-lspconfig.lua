return {
  -- Mason: manejador de paquetes LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- mason-lspconfig: integra Mason con nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Lista de servidores LSP a instalar automáticamente
        ensure_installed = {
          "intelephense", -- PHP
          "lua_ls",       -- Lua
          "pyright",      -- Python
          "bashls",       -- Bash
          "jsonls",       -- JSON
          "biome",        -- Biome (JavaScript/TypeScript)
        },
        automatic_installation = true,
      })
    end,
  },
  -- Configuración de LSP (LazyVim/lazy.nvim style)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",             -- (opcional) autocompletado con nvim-cmp
      { "folke/neodev.nvim", opts = {} }, -- mejora soporte Lua
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Función on_attach: registra autocmd para formatear al guardar si se soporta
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end

      -- Capacidades extendidas (ej. para nvim-cmp)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Handlers automáticos: configura cada servidor instalado sin llamar manualmente a lspconfig
      mason_lspconfig.setup_handlers({
        -- Handler por defecto para todos los servidores
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        -- Configuración específica para Intelephense (PHP)
        ["intelephense"] = function()
          lspconfig.intelephense.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            -- Aquí se pueden añadir opciones específicas de Intelephense
          })
        end,
      })
    end,
  },
}
