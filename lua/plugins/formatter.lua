-- lua/plugins/formatter.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_fallback = true, timeout_ms = 500 }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        php = { "pint" },
        python = { "isort", "black" },
        sh = { "shfmt" },
      },
    },
  },
}
