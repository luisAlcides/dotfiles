return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require("config.null-ls")
    end,
  },
}
