local find_files_hijack_netrw = vim.api.nvim_create_augroup("find_files_hijack_netrw", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function()
        pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
    end,
})
vim.api.nvim_create_autocmd("BufEnter", {
    group = find_files_hijack_netrw,
    pattern = "*",
    callback = function()
        vim.schedule(function()
            if vim.bo[0].filetype == "netrw" or vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
                return
            end

            vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
            vim.cmd("cd %:p:h")

            require("telescope.builtin").find_files({
                cwd = vim.fn.expand("%:p:h"),
            })
        end)
    end,
})

return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      extensions = {
        project = {
          base_dirs = {
            { "~/Developer", max_depth = 0 }
          }
        },
      }
    },
    keys = {
      {"gra", mode = { "v", "n" }, function() return require("telescope").extensions.actions_preview.code_actions() end, desc = "Code actions" },
      {"gri", mode = { "v", "n" }, function() return require("telescope.builtin").lsp_implementations() end, desc = "Go to implementations" },
      {"grr", mode = { "v", "n" }, function() return require("telescope.builtin").lsp_references() end, desc = "Go to references" },
      {"grt", mode = { "v", "n" }, function() return require("telescope.builtin").lsp_type_definitions() end, desc = "Go to type definitions" },

      {"gd", mode = { "v", "n" }, function() return require("telescope.builtin").diagnostics({bufnr = 0}) end, desc = "Show diagnostics" },
      {"gD", mode = { "v", "n" }, function() return require("telescope.builtin").diagnostics() end, desc = "Show workspace diagnostics" },
    }
  },
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "aznhe21/actions-preview.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    'davidgranstrom/telescope-scdoc.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {}
  }
}

