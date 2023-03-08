return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup {
      char = "▏",
      context_char = "▏",
      show_current_context = true,
      show_current_context_start = false,
      show_first_indent_level = true,
      show_trailing_blankline_indent = false,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "packer",
        "NvimTree",
        "Trouble",
      },
    }
  end
}
