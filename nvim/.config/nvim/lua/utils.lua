-- .config/nvim/lua/modules/utils.lua

local M ={}

-- Key Mapper, a utiliy function to map keys to our custom lua functions
function M.key_mapper(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

count_bufs_by_type = function(loaded_only)
    loaded_only = (loaded_only == nil and true or loaded_only)
    count = {normal = 0, acwrite = 0, help = 0, nofile = 0,
    nowrite = 0, quickfix = 0, terminal = 0, prompt = 0}
    buftypes = vim.api.nvim_list_bufs()
    for _, bufname in pairs(buftypes) do
       if (not loaded_only) or vim.api.nvim_buf_is_loaded(bufname) then
           buftype = vim.api.nvim_buf_get_option(bufname, 'buftype')
           buftype = buftype ~= '' and buftype or 'normal'
           count[buftype] = count[buftype] + 1
       end
    end
    return count
end

function M.close_buffer()
  local bufTable = count_bufs_by_type()
  if (bufTable.normal <= 1) then
    local result = vim.api.nvim_exec([[:q]], true)
  else
    local result = vim.api.nvim_exec([[:bd]], true)
  end
end

return M
