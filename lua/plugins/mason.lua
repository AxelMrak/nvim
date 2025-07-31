return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Base tools
      "stylua",
      "shellcheck",
      "shfmt",
      "prettier",
      "black",
      "isort",

      -- Recommended LSPs
      "typescript-language-server", -- For JS/TS/React
      "pyright", -- For Python
      "clangd", -- For C/C++
      "jdtls", -- For Java
      "intelephense", -- For PHP
      "marksman", -- For Markdown
      "json-lsp", -- For JSON
      "yaml-language-server", -- For YAML
      "dockerfile-language-server", -- For Dockerfile
      "tailwindcss-language-server", -- For TailwindCSS
      "gopls", -- For Go
      "vscode-html-languageserver", -- For HTML
      "vscode-css-languageserver", -- For CSS
      "lua_ls", -- For Lua
    },
  },
}