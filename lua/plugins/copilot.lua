return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- Disable inline ghost suggestions to avoid duplication with nvim-cmp
        suggestion = { enabled = false, auto_trigger = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    -- Integrate Copilot into nvim-cmp menu
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
