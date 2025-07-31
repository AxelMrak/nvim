-- lua/plugins/formatter.lua
return {
  -- Formatter using conform.nvim
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      -- LazyVim will handle format-on-save automatically.
      -- We only need to define the formatters for each filetype.
      formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        php = { "phpcs" },
        python = { "isort", "black" },
        sh = { "shfmt" },
      },
    },
  },

  -- Linter using nvim-lint
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufEnter" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "flake8" },
        php = { "phpcs" },
        bash = { "shellcheck" },
      }

      -- Create autocommand to run linting on specific events
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
