local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer! Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost PLUGINS.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({border = "single"})
		end,
	},
})

-- Plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Package manager
  use "kyazdani42/nvim-tree.lua" -- Archives with nvim-tree
  use "kyazdani42/nvim-web-devicons" -- Icons for neovim
  use "nvim-lualine/lualine.nvim" -- Lualine
  use "akinsho/bufferline.nvim" -- Buffers
  use "lukas-reineke/indent-blankline.nvim" -- Indentlines
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "goolord/alpha-nvim" -- Dashboard
  use "NvChad/nvim-colorizer.lua" -- Hexcolors
  use "lewis6991/impatient.nvim"

  -- Colorschemes
  use "ellisonleao/gruvbox.nvim"
  -- use "catppuccin/nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

  -- CMP Plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- CMD line completions
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- Allow configure LSP servers

  -- LSP 
  -- use "neovim/nvim-lspconfig" -- Enable LSP
  -- use "williamboman/mason.nvim" -- Simple to use language server installer
  -- use "williamboman/mason-lspconfig.nvim"
  -- use "jose-elias-alvarez/null-ls.nvim" -- For formatters and linters

  -- use "RRethy/vim-illuminate"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
