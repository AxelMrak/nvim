return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
        -- stylua: ignore
        vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- No necesitas configurar `automatic_installation` o `automatic_setup` directamente aquí
    -- cuando estás utilizando `mason-lspconfig`. Mason se encarga de la instalación.

    -- Configura los servidores que deseas utilizar. En este caso, `tsserver` para TypeScript.
    lspconfig.tsserver.setup({
      -- Aquí puedes agregar configuraciones específicas para tsserver
      -- Por ejemplo:
      -- cmd = { "typescript-language-server", "--stdio" },
      -- root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
      -- settings = {
      --   typescript = {
      --     inlayHints = {
      --       enabled = false,
      --     },
      --   },
      --   javascript = {
      --     inlayHints = {
      --       enabled = false,
      --     },
      --   },
      -- },
      on_attach = function(client, bufnr)
        -- Aquí también puedes definir keymaps específicos para este servidor
        -- Asegúrate de que esto no entre en conflicto con los keymaps definidos en el init de typescript.nvim
        print("tsserver attached to buffer: " .. bufnr)
      end,
    })

    -- Puedes agregar configuraciones para otros servidores de lenguaje aquí si los necesitas
    -- Ejemplo para el lsp de Lua:
    -- lspconfig.lua_ls.setup {}
  end,
}
