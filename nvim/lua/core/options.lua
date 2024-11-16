local options = {
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines

  termguicolors = true, -- enable 24-bit RGB color in the TUI

  showmode = false, -- we don't need to see things like -- INSERT -- anymore

  title = true, -- tab tittle as file 

  mouse = "a", -- allow the mouse to be used in neovim

  cursorline = true,  -- highlight the current line
  cursorcolumn = false,  -- highlight the current column

  showtabline = 2, -- always show tabs

  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  softtabstop = 4,
  smartindent = true, -- make indenting smarter again
  breakindent = true,
  expandtab = true, -- convert tabs to spaces

  hlsearch = true, -- highlight all matches on previous search pattern

  smartcase = true, -- smart case
  ignorecase = true, -- ignore case in search patterns

  clipboard = "unnamedplus", -- allows neovim to access the system clipboard

  splitbelow = true, -- force all horizontal splits to go bellow current window
  splitright = true, -- force all vertical splits to go to the right of current window

  signcolumn = "yes", -- always show the sign column

  -- mostly just for cmp
  completeopt = { "menuone", "noselect" },

  -- go to previous/next line with h,l,left arrow and right arrow
  -- when cursor reaches end/beginning of line
  whichwrap = "<>[]hl"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
