return {
  'nvim-lualine/lualine.nvim',
  priority = 800,
  config = function()
    local icon = require('config.icon')
    local mode = require('config.util').get_mode()

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
            icon = icon.neovim,
            separator = { left = '', right = '' },
            padding = { left = 1, right = 0 },
          },
        },
        lualine_b = {
          { 'branch', icon = icon.git.branch, cond = section_b_cond[1] },
          {
            'diff',
            symbols = {
              added = icon.git.diff.added .. ' ',
              modified = icon.git.diff.modified .. ' ',
              removed = icon.git.diff.removed .. ' ',
            },
            padding = { left = 0, right = 1 },
            cond = section_b_cond[2],
          },
        },
        lualine_c = {
          { '%=', padding = 0 },
          {
            'datetime',
            icon = icon.clock,
            style = '%H:%M ',
            separator = { left = '', right = '' },
            padding = 0,
            color = function()
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
            icon = { icon.directory, color = 'Directory' },
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
      theme = "dracula",
    })
  end,
}
