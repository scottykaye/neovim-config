-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('NvChad/nvim-colorizer.lua')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  --  use({
  --    'folke/tokyonight.nvim',
  --    config = function()
  --      vim.cmd('colorscheme tokyonight')
  --    end
  --  })

  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }


  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        dark_variant = 'moon',
        groups = {
          panel       = "none",
          comment     = 'muted',
          link        = 'iris',
          punctuation = 'subtle',
          error       = 'love',
          hint        = 'iris',
          info        = 'foam',
          warn        = 'gold',
        },
        highlight_groups = {
          Visual                  = { fg = "base", bg = "iris" },
          Cursor                  = { fg = "base", bg = "pine" },
          CursorColumn            = { fg = "base", bg = "gold" },
          ColorColumn             = { fg = "base", bg = "gold" },
          CursorLine              = { bg = "muted", blend = 20 },
          LineNr                  = { fg = "iris", bg = "none" },
          CursorLineNr            = { fg = "base", bg = "love" },
          IncSearch               = { fg = "base", bg = "love" },
          Normal                  = { bg = "none" },
          NormalFloat             = { bg = "none" },
          NormalNC                = { bg = "none" },
          FloatBorder             = { bg = "none" },
          StatusLine              = { fg = "love", bg = "muted", blend = 20 },
          StatusLineNC            = { fg = "rose", bg = "muted", blend = 20 },
          TelescopeBorder         = { fg = "highlight_high", bg = "none" },
          TelescopeNormal         = { bg = "none" },
          TelescopePromptNormal   = { bg = "none" },
          TelescopeResultsNormal  = { fg = "gold", bg = "none" },
          TelescopeSelection      = { fg = "love", bg = "muted", blend = 20 },
          TelescopeSelectionCaret = { fg = "rose", bg = "muted", blend = 20 },

        },
      })



      vim.cmd([[colorscheme rose-pine]])
    end
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  --
  -- f
  --   --
  --
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  --use {
  --  'nvim-tree/nvim-tree.lua',
  --  requires = {
  --    'nvim-tree/nvim-web-devicons', -- optional
  --  },
  --  config = function()
  --    require("nvim-tree").setup {}
  --  end
  --}
end)
