return {
  {
    "akinsho/toggleterm.nvim",
    opts = {},
    config = function(_, opts)
      local Terminal = require("toggleterm.terminal").Terminal

      local bruno = Terminal:new({
        cmd = "bruno",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })

      function _BrunoToggle()
        bruno:toggle()
      end

      vim.keymap.set("n", "<leader>Bb", "<cmd>lua _BrunoToggle()<CR>", { desc = "Bruno: Open API Client" })
    end,
  },
}
