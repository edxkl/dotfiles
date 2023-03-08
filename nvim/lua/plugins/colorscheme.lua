return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("catppuccin").setup {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations: (github.com/catppuccin/nvim#integrations)
      },
      color_overrides = {
        mocha = {
          -- Background
          base      = "#1c1c1c", -- Default bg
          mantle    = "#161616", -- Darker bg
          crust     = "#101010", --	Darkest bg 

          -- Foreground
          text      = "#cccccc", -- Default fg
          subtext1  = "#BAC2DE", -- Indicator
          subtext0  = "#A6ADC8", -- Float title

          overlay2  = "#a3a3a3", -- Popup fg
          overlay1  = "#7F849C", -- Conceal color
          overlay0  = "#505050", -- Fold color

          surface2  = "#6c6c6c", -- Default comment
          surface1  = "#505050", -- Darker comment
          surface0  = "#434343", -- Darkest comment

          -- Colors
          red       = "#ea6962", -- Error #
          green     =	"#89b482", -- Diff add #
          yellow    = "#d8a657", -- Warning #
          blue      = "#7daea3", -- Diff changed

          rosewater = "#F5E0DC", -- Winbar
          flamingo  = "#F2CDCD", -- Target word
          pink      = "#F5C2E7", -- Just pink
          mauve     = "#CBA6F7", -- Tag
          maroon    =	"#EBA0AC", -- Lighter red
          peach     = "#FAB387", -- Number
          teal      = "#94E2D5", -- Hint
          sky       = "#89DCEB", -- Operator
          sapphire  = "#74C7EC", -- Constructor
          lavender  = "#B4BEFE", -- CursorLine Nr
        },
      },
      highlight_overrides = {
        mocha = function(cl)
          return { }
        end,
      }
    }
    vim.cmd.colorscheme "catppuccin"
  end
}
