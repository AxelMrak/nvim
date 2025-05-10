return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "emoji" })

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
    end,
  },
}
