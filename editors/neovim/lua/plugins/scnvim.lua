return {
  {
    'davidgranstrom/scnvim',
    dependencies = { 'davidgranstrom/telescope-scdoc.nvim','L3MON4D3/LuaSnip' },
    ft = { 'scala', 'supercollider' },
    keys = function()
      local editor = require('scnvim.editor')
      local sclang = require('scnvim.sclang')

      return {
        { "<C-CR>", mode = {"n", "i"}, editor.send_block },
        { "<C-CR>", mode = {"x"}, editor.send_selection },
        { "<S-CR>", mode = {"n", "i"}, editor.send_line },
        { "<C-.>", mode = {"n", "i"}, sclang.hard_stop },
    }
    end,
    opts = {},
    config = function(_, opts)
      require("scnvim").setup(opts)
      require("luasnip").add_snippets("supercollider", require("scnvim.utils").get_snippets())
    end
  }
}
