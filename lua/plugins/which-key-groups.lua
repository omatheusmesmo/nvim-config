return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>M", group = "maven" },
        { "<leader>O", group = "opencode" },
        { "<leader>B", group = "bruno" },
      })
    end,
  },
}
