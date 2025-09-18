return {
  'abecodes/tabout.nvim',
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp"
  },
  event = 'InsertCharPre',
  priority = 1000,
  opt = true,
  opts = {
    completion = true,
  },
}
