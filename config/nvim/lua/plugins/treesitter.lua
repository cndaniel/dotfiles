return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "css", "dockerfile", "go", "gomod",
        "html", "javascript", "json", "lua", "markdown",
        "python", "ruby", "rust", "toml", "tsx",
        "typescript", "vim", "vimdoc", "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
