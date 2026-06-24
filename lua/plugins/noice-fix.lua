return {
  {
    "folke/noice.nvim",
    opts = {},
    config = function(_, opts)
      require("noice").setup(opts)

      -- Fix: patch noice treesitter to handle invalid query errors
      local ts_mod = require("noice.text.treesitter")
      local original_get_query = ts_mod.get_query
      ts_mod.get_query = function(lang)
        local ok, result = pcall(original_get_query, lang)
        if not ok then
          return nil
        end
        return result
      end
    end,
  },
}
