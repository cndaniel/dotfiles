return {
  -- Seamless tmux/nvim navigation
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Git commands
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },
  { "tpope/vim-rhubarb" },

  -- Surround
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

  -- Comment toggle
  { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

  -- Auto close pairs
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Test runner (preserves your vim-test muscle memory)
  {
    "vim-test/vim-test",
    keys = {
      { "<Leader>t", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<Leader>s", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<Leader>l", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<Leader>a", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<Leader>gt", "<cmd>TestVisit<cr>", desc = "Test visit" },
    },
  },

  -- Show available keybindings
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

  -- Auto-create parent directories on save
  { "jghauser/mkdir.nvim" },
}
