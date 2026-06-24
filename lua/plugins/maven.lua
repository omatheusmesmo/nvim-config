return {
  {
    "eatgrass/maven.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "java" },
    opts = {
      maven = {
        executable = "mvn",
      },
    },
    keys = {
      { "<leader>Mo", "<cmd>Maven<CR>", desc = "Maven: Open Menu" },
      { "<leader>Mr", "<cmd>MavenReset<CR>", desc = "Maven: Reset" },
    },
  },
}
