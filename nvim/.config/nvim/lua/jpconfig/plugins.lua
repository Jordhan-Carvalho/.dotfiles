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
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Automatic curl braces and stuff like that
  use "numToStr/Comment.nvim" -- Easily comment stuff with gcc, gbc (block wide line wise)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  } -- Nvim tree file explorer
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', branch = 'main'} -- Buffers manager
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } -- status bar
  use {"akinsho/toggleterm.nvim", branch = 'main'}
  use "djoshea/vim-autoread" -- Auto reload when files changes in disk (good for changing branches)
  use "github/copilot.vim" -- Github copilot

  -- ColorSchemes --
  use "morhetz/gruvbox" -- Color theme
  use "folke/tokyonight.nvim" -- Color theme
  use "rakr/vim-one" -- Color Theme
  use "bluz71/vim-nightfly-colors" -- COlor theme
  use "lifepillar/vim-solarized8" -- Color theme
  use "sainnhe/sonokai"-- Color theme
  use "amadeus/vim-evokai" -- Color theme
  use "sainnhe/everforest" -- Color theme
  use "nanotech/jellybeans.vim" -- Color theme
  use "mcchrish/hyperterm-gruvbox-dark" -- Color theme
  use "tomasr/molokai" -- Color theme
  use "bluz71/vim-moonfly-colors" -- Color theme
  use "patstockwell/vim-monokai-tasty" -- Color theme

  -- cmp plugins (completion)
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  --[[ use "hrsh7th/cmp-path" -- path completions ]]
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completion
  use "hrsh7th/cmp-nvim-lua" -- Helps in configuring nvim lua config

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters ]]

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "p00f/nvim-ts-rainbow" -- Different colors for brackets
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Support for jsx comments with gcc and gbc

  -- Git 
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
