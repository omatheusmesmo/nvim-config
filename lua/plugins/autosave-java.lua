return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    debounce_delay = 10000,
    execution_message = {
      enabled = false,
    },
    condition = function(buf)
      return vim.bo[buf].filetype == "java" and vim.bo[buf].modified
    end,
  },
}
