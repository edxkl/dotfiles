return {
  "akinsho/bufferline.nvim",
  config = function() 
    require('bufferline').setup {
      options = {
        -- numbers = ( "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string )
        numbers = "none", 
        indicator = {
          style = "icon",
          icon = "▎"
        },
        buffer_close_icon = "󱎘",
        modified_icon = "",
        close_icon = "󱎘",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 18, -- prefix used when a buffer is de-duplicated
        tab_size = 25,
        diagnostics = false, -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "center",
          }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
    }
  end
}
