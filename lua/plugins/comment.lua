return {
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require("Comment.ft")

      ft.set("typescriptreact", { "{/**", "**/}" })
      ft.set("javascriptreact", { "{/**", "**/}" })

      require("Comment").setup()
    end,
    keys = {
      { "gcc", mode = "n" },
      { "gbc", mode = "n" },
      { "gc", mode = "v" },
      { "gb", mode = "v" },
    },
  },
}
