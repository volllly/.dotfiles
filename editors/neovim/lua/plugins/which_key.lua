return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    {
      "<c-w><space>",
      desc = "+hydra",
      ft = "supercollider",
      function() require("which-key").show({ keys = "<c-w>", loop = true }) end
    },
    {
      ",?",
      mode = "n",
      desc = "Help",
      ft = "supercollider",
      function() return require("telescope").extensions.scdoc.scdoc() end
    },
    {
      ",b",
      mode = "n",
      desc = "Start server",
      ft = "supercollider",
      function() require('scnvim.sclang').start() end 
    },
    {
      ",s",
      mode = "n",
      desc = "Stop server",
      ft = "supercollider",
      function() require('scnvim.sclang').stop() end 
    },
    {
      ",.",
      mode = "n",
      desc = "Stop sound",
      ft = "supercollider",
      function() require('scnvim.sclang').hard_stop() end 
    }
  },
  opts = {
    preset = "helix",
    disable = {
      ft = {
        "TelescopePrompt"
      }
    },
    spec = {
      { 
        "<leader>f",
        group = "file",
        expand = function()
          return {
            {
              "l",
              desc = "Find file",
              mode = "n",
              function() return require("telescope.builtin").find_files() end
            },
            {
              "e",
              desc = "Explore files",
              mode = "n",
              function() return require("telescope").extensions.file_browser.file_browser({
                path = "%:p:h"
              }) end
            },
            {
              "p",
              desc = "Open project",
              mode = "n",
              function() return require("telescope").extensions.project.project() end
            },
            {
              "g",
              desc = "Live grep",
              mode = "n",
              function() return require("telescope.builtin").live_grep() end
            },
          }
       end
      },
      {
        "<leader>b",
        desc = "Buffers",
        function() return require("telescope.builtin").buffers() end
      },
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      {
        "<leader>l",
        group = "Language Server",
        expand = function()
          return {
            {
              "d",
              mode = "n",
              function()
                local wd = require("workspace-diagnostics")
                for _, client in ipairs(vim.lsp.get_clients()) do
                  wd.populate_workspace_diagnostics(client, 0)
                end
              end
            }
          }
        end
      },
      {
        ",",
        group = "master",
        expand = function()
          return {
          }
        end
      }
    }
  },
}
