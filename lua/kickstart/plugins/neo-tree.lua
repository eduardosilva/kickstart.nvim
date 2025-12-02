-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        -- position = 'float', -- Set window position to 'float'
        mappings = {
          -- General file operations
          ['r'] = 'refresh', -- Refresh NeoTree
          ['R'] = 'rename', -- Rename file or folder
          ['d'] = 'delete', -- Delete file or folder
          ['c'] = 'copy', -- Copy file or folder
          ['x'] = 'cut_to_clipboard', -- Cut file or folder
          ['p'] = 'paste_from_clipboard', -- Paste file or folder
          ['y'] = 'copy_to_clipboard', -- Yank file path

          -- File/folder navigation
          ['l'] = 'open', -- Expand folder or open file
          ['h'] = 'close_node', -- Collapse folder
          ['<CR>'] = 'open', -- Open file or directory
          ['<BS>'] = 'navigate_up', -- Go up one directory
          ['P'] = {
            'toggle_preview',
            config = {
              use_float = false,
            },
          },

          -- Source navigation
          ['H'] = 'prev_source', -- Switch to the previous source (buffers, git, etc.)
          ['L'] = 'next_source', -- Switch to the next source

          -- Hidden files & window management
          ['.'] = 'toggle_hidden', -- Toggle hidden files
          ['\\'] = 'close_window', -- Close NeoTree
        },
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree').close_all() -- Close NeoTree when a file is opened
        end,
      },
    },
  },
}
