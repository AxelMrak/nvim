return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        color_icons = true,
        separator_style = "thin",
        indicator = { style = "underline" },
        offsets = {
          { filetype = "NvimTree", text = "Files", text_align = "left", separator = true },
        },
      },
    },
    keys = {
      { "<S-l>", ":BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-h>", ":BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<leader>1", ":BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
      { "<leader>2", ":BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
      { "<leader>3", ":BufferLineGoToBuffer 3<CR>", desc = "Buffer 3" },
      { "<leader>4", ":BufferLineGoToBuffer 4<CR>", desc = "Buffer 4" },
      { "<leader>5", ":BufferLineGoToBuffer 5<CR>", desc = "Buffer 5" },
      { "<leader>6", ":BufferLineGoToBuffer 6<CR>", desc = "Buffer 6" },
      { "<leader>7", ":BufferLineGoToBuffer 7<CR>", desc = "Buffer 7" },
      { "<leader>8", ":BufferLineGoToBuffer 8<CR>", desc = "Buffer 8" },
      { "<leader>9", ":BufferLineGoToBuffer 9<CR>", desc = "Buffer 9" },
      { "<leader>bd", ":bdelete<CR>", desc = "Delete buffer" },
    },
  },
}

