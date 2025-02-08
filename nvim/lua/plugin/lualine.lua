return {
  'nvim-lualine/lualine.nvim',
  priority = 800,
  config = function()
    local icons = require('config.icons')

    local section_b_cond = vim
      .iter({ 95, 115 })
      :map(function(nr)
        return function()
          return vim.o.columns >= nr
        end
      end)
      :totable()

    -- 기본 lualine 설정
    vim.opt.showmode = false
    vim.opt.fillchars = vim.tbl_extend('force', vim.opt.fillchars:get(), {
      stl = '━',
      stlnc = '━',
    })

    -- lualine 옵션 설정
    require('lualine').setup({
      globalstatus = vim.o.laststatus == 3,
      component_separators = '',
      section_separators = { left = '', right = '' },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = icons.neovim,
            separator = { left = '', right = '' },
            padding = { left = 1, right = 0 },
          },
        },
        lualine_b = {
          { 'branch', icon = icons.git.branch, cond = section_b_cond[1] },
          {
            'diff',
            symbols = {
              added = icons.git.diff.added .. ' ',
              modified = icons.git.diff.modified .. ' ',
              removed = icons.git.diff.removed .. ' ',
            },
            padding = { left = 0, right = 1 },
            cond = section_b_cond[2],
          },
        },
        lualine_c = {
          { '%=', padding = 0 },
          {
            'datetime',
            icon = icons.clock,
            style = '%H:%M ',
            separator = { left = '', right = '' },
            padding = 0,
            color = function()
              local mode = require('local.theme').get_mode()

              return 'lualine_a_' .. mode
            end,
          },
        },
        lualine_y = {
          {
            'filetype',
            fmt = function(name)
              return string.upper(name)
            end,
            cond = section_b_cond[1],
          },
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            icon = { icons.directory, color = 'Directory' },
            cond = section_b_cond[2],
          },
        },
        lualine_z = {
          {
            'location',
            separator = { left = '', right = '' },
            padding = { left = 0, right = 1 },
          },
        },
      },
      extensions = {},
      theme = require('local.theme').gen_lualine_theme(),
    })
  end,
}
