return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require "alpha"

    local function button(sc, txt, keybind)
      local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

      local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons",
      }

      if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
      end

      return {
        type = "button",
        val = txt,
        on_press = function()
          local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
          vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
      }
    end

    local default = {}

    default.logo = {
      [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
      [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
      [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
      [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
      [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
      [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
      [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
      [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
      [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
      [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
      [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
    }
    default.header = {
      type = "text",
      val = default.logo,
      opts = {
        position = "center",
        hl = "AlphaHeader"
      },
    }

    default.buttons = {
      type = "group",
      val = {
        button("e", "  New file",      ":ene <BAR> startinsert <CR>"),
        button("f", "  File Explorer", ":NvimTreeToggle <CR>"),
        button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        button("p", "  Plugins",       ":Lazy <CR>"),
        button("q", "  Quit",          ":qa<CR>"),
      },
      opts = {
        spacing = 1,
      },
    }

    local function footer()
      local lazy = require("lazy")
      local total_plugins = " " .. lazy.stats().count .. " Plugins"

      return total_plugins
    end
    default.footer = {
      type = "text",
      val = footer(),
      opts = {
        position = "center",
        hl = "Number"
      }
    }
    
    local fn = vim.fn
	  local marginTopPercent = 0.3
	  local headerPadding = fn.max({2, fn.floor(fn.winheight(0) * marginTopPercent) })

    alpha.setup {
      layout = {
        { type = "padding", val = headerPadding },
        default.header,
        { type = "padding", val = 2 },
        default.buttons,
        default.footer
      },
      opts = {},
    }

    -- Disable the statusline, tabline and cmdline while the alpha dashboard is open
    local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
    autocmd('User', {
      pattern = 'AlphaReady',
      desc = 'disable status, tabline and cmdline for alpha',
      callback = function()
    	  vim.go.laststatus = 0
        vim.opt.showtabline = 0
    	  vim.opt.cmdheight = 0
      end,
    })
    autocmd('BufUnload', {
      buffer = 0,
      desc = 'enable status, tabline and cmdline after alpha',
      callback = function()
        vim.go.laststatus = 2
        vim.opt.showtabline = 2
    	  vim.opt.cmdheight = 1
      end,
    })
  end
}
