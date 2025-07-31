return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "stylua",
        -- shell
        "shellcheck",
        "shfmt",
        -- python
        "flake8",
        "isort",
        "black",
        -- web
        "prettier",
        "eslint_d",
        -- php
        "phpcs",
      },
    },
  },
}
