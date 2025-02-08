local M = {};

M.get_mode = function()
  local mode = vim.fn.mode()

  if vim.list_contains({ 'i', 'ic', 'ix' }, mode) then
    return 'insert'
  end

  -- '\22' is CTRL-V (see `h: nvim_replace_termcodes()`)
  if
    vim.list_contains({ 'v', 'vs', 'V', 'Vs', '\22', '\22s', 's', 'S', 'CTRL-S' }, mode)
  then
    return 'visual'
  end

  if vim.list_contains({ 'R', 'Rc', 'Rv', 'Rvc', 'Rvx' }, mode) then
    return 'replace'
  end

  if vim.list_contains({ 'c', 'cr', 'cv', 'cvr' }, mode) then
    return 'command'
  end

  return 'normal'
end

return M;
