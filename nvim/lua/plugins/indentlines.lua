return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("ibl").setup {
      indent = {
        char = "▏" 
      },
      scope = { 
        enabled = false,
      },
      exclude = {
        buftypes = {
          "terminal", 
          "nofile"
        },
        filetypes = {
          "help",
          "terminal",
          "dashboard",
          "NvimTree",
          "Trouble",
        },
      },
    }

    -- local hooks = require "ibl.hooks"
    -- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

  end
}
