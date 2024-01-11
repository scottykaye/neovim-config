-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use('NvChad/nvim-colorizer.lua')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  })
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use("lukas-reineke/indent-blankline.nvim")
  use('stevearc/dressing.nvim')
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  })
  use('nvim-tree/nvim-web-devicons')
  use({
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
  })
  use('MunifTanjim/prettier.nvim')
  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")
  use("f-person/git-blame.nvim")
  use("dnlhc/glance.nvim")
  use('iamcco/markdown-preview.nvim')
  use('rcarriga/nvim-notify')
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  })

  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    event = 'VimEnter',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      math.randomseed(os.time())

      local function pick_color()
        local colors = { "String", "Identifier", "Keyword", "Number" }
        return colors[math.random(#colors)]
      end

      local function footer()
        local total_plugins = #vim.tbl_keys(packer_plugins)
        local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

        return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
      end

      local logo = {

        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ", }

      dashboard.section.header.val = logo
      dashboard.section.header.opts.hl = pick_color()

      dashboard.section.buttons.val = {
        dashboard.button("<leader>fb", "  File Browser"),
        dashboard.button("<leader>pf", "  Find File"),
        dashboard.button("<C-e>", "  Recent Project Files"),
        dashboard.button("<leader>ps", "  Project Search"),
        dashboard.button("<leader>vpp", "  Update plugins"),
        dashboard.button("q", "  Quit", ":qa<cr>")
      }

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Constant"

      alpha.setup(dashboard.opts)

      vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
  })

  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
      })
    end
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use({
    'Mofiqul/dracula.nvim',
    as = "dracula",
    config = function()
      require("dracula").setup({
        -- customize dracula color palette
        colors = {
          bg = "none",
          fg = "#F8F8F2",
          selection = "#44475A",
          comment = "#6272A4",
          red = "#FF5555",
          orange = "#FFB86C",
          yellow = "#F1FA8C",
          green = "#50fa7b",
          purple = "#BD93F9",
          cyan = "#8BE9FD",
          --   original is directly below
          --   pink = "#FF79C6",
          --   pink = "#FF3884",
          --   pink = "#FF34A3",
          pink = "#FF37BA",
          bright_red = "#FF6E6E",
          bright_green = "#69FF94",
          bright_yellow = "#FFFFA5",
          bright_blue = "#D6ACFF",
          -- original is directly below
          -- bright_magenta = "#FF92DF",
          bright_magenta = "#FF79c6",
          bright_cyan = "#A4FFFF",
          bright_white = "#FFFFFF",
          menu = "#21222C",
          visual = "#3E4452",
          gutter_fg = "#4B5263",
          nontext = "#3B4048",
          white = "#ABB2BF",
          black = "#191A21",
        },
        -- show the '~' characters after the end of buffers
        show_end_of_buffer = true,    -- default false
        -- use transparent background
        transparent_bg = true,        -- default false
        -- set custom lualine background color
        lualine_bg_color = "#44475a", -- default nil
        -- set italic comment
        italic_comment = true,        -- default false
        -- overrides the default highlights with table see `:h synIDattr`
        -- You can use overrides as table like this
        -- overrides = {
        --   NonText = { fg = "white" }, -- set NonText fg to white
        --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        --   Nothing = {} -- clear highlight of Nothing
        -- },
        -- Or you can also use it like a function to get color from theme
        overrides = function(colors)
          return {
            NonText = { fg = colors.white }, -- set NonText fg to white of theme
            DiffAdd = { bg = colors.bright_green },
            DiffDelete = { fg = colors.bright_red },
            DiffChange = { bg = colors.comment },
            DiffText = { bg = colors.comment },

            Cursor = { reverse = true, },
            CursorLineNr = { fg = colors.black, bg = colors.bright_yellow, bold = true, },
            SignColumn = { bg = colors.bg, },
            Conceal = { fg = colors.comment, },
            CursorColumn = { fg = colors.black, bg = colors.bright_yellow, },
            CursorLine = { bg = colors.selection, },
            ColorColumn = { bg = colors.bright_yellow },
            Directory = { fg = colors.purple, },

            ErrorMsg = { fg = colors.bright_red, },
            VertSplit = { fg = colors.white, },
            Folded = { fg = colors.comment, },
            FoldColumn = {},
            Search = { fg = colors.black, bg = colors.bright_magenta, },
            IncSearch = { fg = colors.bright_green, bg = colors.comment, },
            LineNr = { fg = colors.white, },
            MatchParen = { fg = colors.fg, underline = true, },
            Pmenu = { fg = colors.white, bg = colors.menu, },
            PmenuSel = { fg = colors.white, bg = colors.selection, },
            PmenuSbar = { bg = colors.bg, },
            PmenuThumb = { bg = colors.selection, },

            illuminatedWord = { bg = colors.comment },
            illuminatedCurWord = { bg = colors.comment },
            IlluminatedWordText = { bg = colors.comment },
            IlluminatedWordRead = { bg = colors.comment },
            IlluminatedWordWrite = { bg = colors.comment },

            StatusLine = { fg = colors.black, bg = colors.bright_yellow, bold = true },
            StatusLineNC = { fg = colors.comment, },
            StatusLineTerm = { fg = colors.white, bg = colors.black, },
            StatusLineTermNC = { fg = colors.comment, },

            TelescopePromptBorder = { fg = colors.bright_green, },
            TelescopeResultsBorder = { fg = colors.bright_green, },
            TelescopePreviewBorder = { fg = colors.bright_green },
            TelescopeSelection = { fg = colors.bright_green, bg = colors.selection, },
            TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
            TelescopeNormal = { fg = colors.white, bg = colors.bg },
            TelescopeMatching = { fg = colors.bright_green, },
            TelescopePromptPrefix = { fg = colors.purple, },
            TelescopeResultsDiffDelete = { fg = colors.red },
            TelescopeResultsDiffChange = { fg = colors.cyan },
            TelescopeResultsDiffAdd = { fg = colors.green },

            markdownBlockquote = { fg = colors.yellow, italic = true, },
            markdownBold = { fg = colors.orange, bold = true, },
            markdownCode = { fg = colors.green, },
            markdownCodeBlock = { fg = colors.orange, },
            markdownCodeDelimiter = { fg = colors.red, },
            markdownH1 = { fg = colors.pink, bold = true, },
            markdownH2 = { fg = colors.pink, bold = true, },
            markdownH3 = { fg = colors.pink, bold = true, },
            markdownH4 = { fg = colors.pink, bold = true, },
            markdownH5 = { fg = colors.pink, bold = true, },
            markdownH6 = { fg = colors.pink, bold = true, },
            markdownHeadingDelimiter = { fg = colors.red, },
            markdownHeadingRule = { fg = colors.comment, },
            markdownId = { fg = colors.purple, },
            markdownIdDeclaration = { fg = colors.cyan, },
            markdownIdDelimiter = { fg = colors.purple, },
            markdownItalic = { fg = colors.yellow, italic = true, },
            markdownLinkDelimiter = { fg = colors.purple, },
            markdownLinkText = { fg = colors.pink, },
            markdownListMarker = { fg = colors.cyan, },
            markdownOrderedListMarker = { fg = colors.red, },
            markdownRule = { fg = colors.comment, },


          }
        end
      })
      vim.cmd([[colorscheme dracula]])
    end
  })
  --  Haven't been using this. This produces a new vim tree that stays with you
  --use {
  --  'nvim-tree/nvim-tree.lua',
  --  requires = {
  --    'nvim-tree/nvim-web-devicons', -- optional
  --  },
  --  config = function()
  --    require("nvim-tree").setup {}
  --  end
  --}
  -- use { "ellisonleao/gruvbox.nvim" }
  --   require("gruvbox").setup({
  --   terminal_colors = true, -- add neovim terminal colors
  --   undercurl = true,
  --   underline = true,
  --   bold = true,
  --   italic = {
  --     strings = true,
  --     emphasis = true,
  --     comments = true,
  --     operators = false,
  --     folds = true,
  --   },
  --   strikethrough = true,
  --   invert_selection = false,
  --   invert_signs = false,
  --   invert_tabline = false,
  --   invert_intend_guides = false,
  --   inverse = true, -- invert background for search, diffs, statuslines and errors
  --   contrast = "", -- can be "hard", "soft" or empty string
  --   palette_overrides = {},
  --   overrides = {},
  --   dim_inactive = false,
  --   transparent_mode = false,
  --     palette_overrides = {
  --         bright_green = "#66ff00",
  --     }
  -- })
  -- vim.cmd("colorscheme gruvbox")

  --  use({
  --    'rose-pine/neovim',
  --    as = 'rose-pine',
  --    config = function()
  --      require("rose-pine").setup({
  --        dark_variant = 'moon',
  --        groups = {
  --          panel       = "none",
  --          comment     = 'muted',
  --          link        = 'iris',
  --          punctuation = 'subtle',
  --          error       = 'love',
  --          hint        = 'iris',
  --          info        = 'foam',
  --          warn        = 'gold',
  --        },
  --        highlight_groups = {
  --          Visual                  = { fg = "base", bg = "iris" },
  --          Cursor                  = { fg = "base", bg = "pine" },
  --          CursorColumn            = { fg = "base", bg = "gold" },
  --          ColorColumn             = { fg = "base", bg = "gold" },
  --          CursorLine              = { bg = "muted", blend = 20 },
  --          LineNr                  = { fg = "iris", bg = "none" },
  --          CursorLineNr            = { fg = "base", bg = "love" },
  --          IncSearch               = { fg = "base", bg = "love" },
  --          Normal                  = { bg = "none" },
  --          NormalFloat             = { bg = "none" },
  --          NormalNC                = { bg = "none" },
  --          FloatBorder             = { bg = "none" },
  --          StatusLine              = { fg = "love", bg = "muted", blend = 20 },
  --          StatusLineNC            = { fg = "rose", bg = "muted", blend = 20 },
  --          TelescopeBorder         = { fg = "highlight_high", bg = "none" },
  --          TelescopeNormal         = { bg = "none" },
  --          TelescopePromptNormal   = { bg = "none" },
  --          TelescopeResultsNormal  = { fg = "gold", bg = "none" },
  --          TelescopeSelection      = { fg = "love", bg = "muted", blend = 20 },
  --          TelescopeSelectionCaret = { fg = "rose", bg = "muted", blend = 20 },
  --
  --        },
  --      })
  --
  --
  --
  --      vim.cmd([[colorscheme rose-pine]])
  --    end
  --  })
end)
