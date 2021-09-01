local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system{'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}
  vim.cmd'packadd packer.nvim'
end

local packer = require'packer'

packer.startup(function()
  use 'sainnhe/gruvbox-material'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/completion-nvim'
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
	use 'nvim-lua/lsp-status.nvim'
	use {
		'nvim-lua/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-project.nvim'
		}
	}
	use 'nvim-lua/popup.nvim'
	use 'jremmen/vim-ripgrep'
	use 's1n7ax/nvim-terminal'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'b3nj5m1n/kommentary'
	use {
		'jghauser/mkdir.nvim',
		config = function()
			require('mkdir')
		end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use 'ggandor/lightspeed.nvim'
end)

require'config.settings'
require'config.gitsigns'
require'config.lsp'
require'config.treesitter'
require'config.telescope'
require'config.terminal'
require'config.lualine'
require'config.lightspeed'
