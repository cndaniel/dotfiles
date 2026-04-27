return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "\\", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<Leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<Leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<Leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    })
    telescope.load_extension("fzf")
  end,
}
