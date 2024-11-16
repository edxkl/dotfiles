return {
  "nvim-tree/nvim-tree.lua",
  cmd = {
    "NvimTreeOpen",
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    local nvim_tree = require "nvim-tree"

    nvim_tree.setup {
      on_attach = on_attach,
      view = {
        width = 40,
        side = "left",
      },
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "󰌵",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        root_folder_modifier = ":t",
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            none = " ",
          },
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "󰉋",
              open = "󰝰",
              empty = "󰉖",
              empty_open = "󰷏",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }

  -- disable highlights on nvim_tree
  vim.cmd [[
  :hi link NvimTreeSpecialFile NvimTreeNormal
  :hi link NvimTreeExecFile text
  :hi NvimTreeSymlink guifg=red
  ]]
  
  end
}
