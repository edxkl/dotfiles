local status_ok, colorscheme = pcall(require, "gruvbox")
if not status_ok then
  return
end

colorscheme.setup({
  contrast = "", -- Can be "hard", "soft" or empty string
  transparent_mode = false,
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- Invert background for search, diffs, statuslines and errors
  dim_inactive = false,

  palette_overrides = {
    dark0 = "#1c1c1c", -- Background
    light1 = "#ebdbc5", -- Foreground

    -- Colors
    bright_red = "#ea6962",
    bright_green = "#a9b665",
    bright_yellow = "#d8a657",
    bright_blue = "#7daea3",
    bright_purple = "#d3869b",
    bright_aqua = "#89b482",
    bright_orange = "#e78a4e",
  },
  overrides = {
    NormalFloat = { bg = "#161616" },
    FloatBorder = { bg = "#161616" },
    SignColumn = { bg = "NONE" },
    GruvboxRedSign = { bg = "NONE" },
    GruvboxYellowSign = { bg = "NONE" },
    GruvboxBlueSign = { bg = "NONE" },
    GruvboxAquaSign = { bg = "NONE" },
  },
})

-- NvimTree fixes
vim.cmd('hi NvimTreeNormal guibg=#161616')
vim.cmd('hi NvimTreeWinSeparator guifg=#1c1c1c guibg=#1c1c1c')

-- Indentline fixes
vim.cmd('hi IndentBlanklineContextChar guifg=#ebdbb2')

-- Set colorscheme
vim.cmd[[colorscheme gruvbox]]
