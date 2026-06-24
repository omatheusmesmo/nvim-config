return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local maven_build = Terminal:new({
        cmd = "mvn clean compile",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_install = Terminal:new({
        cmd = "mvn clean install",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_test = Terminal:new({
        cmd = "mvn test",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_package = Terminal:new({
        cmd = "mvn clean package -DskipTests",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_clean = Terminal:new({
        cmd = "mvn clean",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_dep_tree = Terminal:new({
        cmd = "mvn dependency:tree",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local maven_freeform = Terminal:new({
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      function _MavenBuild()
        maven_build:toggle()
      end

      function _MavenInstall()
        maven_install:toggle()
      end

      function _MavenTest()
        maven_test:toggle()
      end

      function _MavenTestSingle()
        vim.ui.input({ prompt = "Test class or method (e.g. com.example.MyTest or MyTest#testMethod): " }, function(input)
          if input and input ~= "" then
            maven_freeform:toggle("mvn test -Dtest=" .. input)
          end
        end)
      end

      function _MavenPackage()
        maven_package:toggle()
      end

      function _MavenClean()
        maven_clean:toggle()
      end

      function _MavenDepTree()
        maven_dep_tree:toggle()
      end

      function _MavenCustom()
        vim.ui.input({ prompt = "Maven command: mvn " }, function(input)
          if input and input ~= "" then
            maven_freeform:toggle("mvn " .. input)
          end
        end)
      end

      vim.keymap.set("n", "<leader>Mb", "<cmd>lua _MavenBuild()<CR>", { desc = "Maven: Compile" })
      vim.keymap.set("n", "<leader>Mi", "<cmd>lua _MavenInstall()<CR>", { desc = "Maven: Install" })
      vim.keymap.set("n", "<leader>Mt", "<cmd>lua _MavenTest()<CR>", { desc = "Maven: Run Tests" })
      vim.keymap.set("n", "<leader>Ms", "<cmd>lua _MavenTestSingle()<CR>", { desc = "Maven: Run Single Test" })
      vim.keymap.set("n", "<leader>Mp", "<cmd>lua _MavenPackage()<CR>", { desc = "Maven: Package (skip tests)" })
      vim.keymap.set("n", "<leader>Mc", "<cmd>lua _MavenClean()<CR>", { desc = "Maven: Clean" })
      vim.keymap.set("n", "<leader>Md", "<cmd>lua _MavenDepTree()<CR>", { desc = "Maven: Dependency Tree" })
      vim.keymap.set("n", "<leader>Mx", "<cmd>lua _MavenCustom()<CR>", { desc = "Maven: Custom Command" })
    end,
  },
}
