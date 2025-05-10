return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "nvim-tree/nvim-web-devicons", -- Optional for file icons
      "nvim-telescope/telescope-fzf-native.nvim", -- Optional for improved sorting performance
    },
    build = function()
      pcall(require("telescope").load_extension, "fzf")
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find Help",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- Load fzf-native extension if installed
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
