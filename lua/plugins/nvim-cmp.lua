return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "tailwind-tools",
      {
        "onsails/lspkind-nvim",
        lazy = true,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "emoji" })

      local has_lspkind, lspkind = pcall(require, "lspkind")

      opts.mapping = {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping(function(fallback)
          fallback()
        end),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
      }

      if has_lspkind then
        opts.formatting = {
          format = lspkind.cmp_format({
            before = require("tailwind-tools.cmp").lspkind_format,
          }),
        }
      end

      return opts
    end,
  },
}
