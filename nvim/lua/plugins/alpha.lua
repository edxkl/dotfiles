local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                      ]],
  [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
  [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
  [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
  [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
  [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
  [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
  [[                                                      ]],
}
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  File Explorer", ":NvimTreeToggle <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune

	return "Olá, mundo!"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- disable bufferline on alpha
vim.cmd [[
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]