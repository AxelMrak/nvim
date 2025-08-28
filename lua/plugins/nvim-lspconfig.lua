return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Enhanced capabilities for better completion
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    }

    local on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = "LSP: " .. desc })
      end
      map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
      map("n", "gr", vim.lsp.buf.references, "Show References")
      map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
      map("n", "gt", vim.lsp.buf.type_definition, "Go to Type Definition")
      map("n", "K", vim.lsp.buf.hover, "Show Documentation")
      map("n", "<leader>li", vim.lsp.buf.implementation, "Go to Implementation")
      map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
      map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>la", vim.lsp.buf.code_action, "Code Actions")
      map("n", "<leader>le", vim.diagnostic.open_float, "Show Line Diagnostics")
      map("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, "Format Document")
      map("v", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, "Format Selection")
      map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      map("n", "<leader>ld", vim.diagnostic.setloclist, "Diagnostics List")

      if client.name == "ts_ls" or client.name == "tsserver" or client.name == "vtsls" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end

    -- Server-specific configurations
    local server_configs = {
      -- TypeScript/JavaScript
      ts_ls = {
        init_options = {
          maxTsServerMemory = 8192,
          npmLocation = "npm",
          preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
      -- Python
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
            },
          },
        },
      },

      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim", "use" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
            hint = { enable = true },
          },
        },
      },

      -- Go
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },

      -- Rust
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      },

      -- C/C++
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
        },
      },

      -- HTML
      html = {
        filetypes = { "html", "templ" },
      },

      -- CSS
      cssls = {
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },

      -- TailwindCSS
      tailwindcss = {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
        },
      },

      -- JSON
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },

      -- YAML
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },

      -- Emmet
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
        },
      },

      -- PHP
      intelephense = {
        settings = {
          intelephense = {
            files = {
              maxSize = 1000000,
            },
          },
        },
      },

      -- Java
      jdtls = {
        -- Note: jdtls is usually configured separately with nvim-jdtls
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
          },
        },
      },

      -- Docker
      dockerls = {},

      -- Bash
      bashls = {},

      -- SQL
      sqlls = {},

      -- Prisma
      prismals = {},

      -- Markdown
      marksman = {},

      -- Terraform
      terraformls = {},
    }

    -- Setup mason-lspconfig integration
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(server_configs),
      automatic_installation = true,
    })

    -- Setup handlers for all servers
    mason_lspconfig.setup_handlers({
      -- Default handler for servers without custom config
      function(server_name)
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        -- Apply server-specific configuration
        if server_configs[server_name] then
          opts = vim.tbl_deep_extend("force", opts, server_configs[server_name])
        end

        lspconfig[server_name].setup(opts)
      end,
    })

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        spacing = 2,
        prefix = "●",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Diagnostic signs
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
