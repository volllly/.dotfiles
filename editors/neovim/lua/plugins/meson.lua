return {
  {
    "mason-org/mason.nvim",
    opts = {
     registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  }
}
