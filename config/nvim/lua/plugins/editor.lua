return {
  -- Seamless tmux/nvim navigation
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  -- Git signs in gutter + hunk keymaps
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(l, r, desc)
          vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc })
        end
        map("]c", function()
          if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else gs.nav_hunk("next") end
        end, "Next hunk")
        map("[c", function()
          if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else gs.nav_hunk("prev") end
        end, "Prev hunk")
        map("<Leader>hs", gs.stage_hunk, "Stage hunk")
        map("<Leader>hr", gs.reset_hunk, "Reset hunk")
        map("<Leader>hp", gs.preview_hunk, "Preview hunk")
        map("<Leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("<Leader>hd", gs.diffthis, "Diff this")
      end,
    },
  },

  -- Statusline (Tokyo Night + powerline, matching the tmux bar)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
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
