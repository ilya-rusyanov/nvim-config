local git_blame = require('gitblame')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', },
    lualine_c = {'diagnostics', 'diff', {'filename',
        path = 1, -- show relative path
      },

    },
    lualine_x = { 
        { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
        { 'encoding', 'fileformat', 'filetype'},
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {{'filename', path = 1}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
  },
  inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {{'filename', path = 1}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
  },
  extensions = {}
}
