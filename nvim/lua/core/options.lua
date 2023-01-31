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
  -- softtabstop = 2,
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  smartindent = true, -- make indenting smarter again
  expandtab = true, -- convert tabs to spaces
  hlsearch = true, -- highlight all matches on previous search pattern
  smartcase = true, -- smart case
  ignorecase = true, -- ignore case in search patterns
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  splitbelow = true, -- force all horizontal splits to go bellow current window
  splitright = true, -- force all vertical splits to go to the right of current window
  signcolumn = "yes" -- always show the sign column
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
