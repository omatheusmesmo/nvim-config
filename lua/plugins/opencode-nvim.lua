return {
  {
    "nickjvandyke/opencode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "OpenCode", "OpenCodeChat" },
    init = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          port = 8081,
        },
      }
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>Oa", function() require("opencode").ask("@this: ") end, { desc = "OpenCode: Ask" })
      vim.keymap.set({ "n", "x" }, "<leader>Os", function() require("opencode").select() end, { desc = "OpenCode: Select" })
      vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end, { desc = "OpenCode: Append range", expr = true })
      vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "OpenCode: Append line", expr = true })
      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "OpenCode: Scroll up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "OpenCode: Scroll down" })
    end,
  },
}
