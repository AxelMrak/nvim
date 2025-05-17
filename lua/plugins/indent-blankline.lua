return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        highlight = {
          "SoftRed",
          "SoftYellow",
          "SoftBlue",
          "SoftOrange",
          "SoftGreen",
          "SoftViolet",
          "SoftCyan",
        },
      },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        local colors = {
          SoftRed = "#7f4c4c", -- rojo oscuro desaturado
          SoftYellow = "#7f7040", -- mostaza suave
          SoftBlue = "#4c5a7f", -- azul grisáceo
          SoftOrange = "#7f5a3a", -- naranja quemado
          SoftGreen = "#4c7f5a", -- verde apagado
          SoftViolet = "#6a4c7f", -- violeta opaco
          SoftCyan = "#407f7a", -- cian grisáceo
        }

        for group, color in pairs(colors) do
          vim.api.nvim_set_hl(0, group, { fg = color })
        end
      end)

      require("ibl").setup(opts)
    end,
  },
}
