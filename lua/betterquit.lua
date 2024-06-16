local betterquit = {}

local function buffer_count()
  local bufs = vim.api.nvim_list_bufs()
  count = 0

  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) then
      count = count + 1
    end
  end

  return count
end

local function close_buffer_or_quit(opts)
  local default_opts = { bang = false }
  opts = opts or default_opts
  num_buffers = buffer_count()

  if opts.bang then -- Close everything without saving, just like :q! should
    vim.cmd.quit { bang = opts.bang, mods = { silent = true } }
  elseif num_buffers <= 1 then -- This is the last buffer.
    vim.cmd.quit() -- default quit behavior, will warn if there are unsaved changes in the last buffer
  else -- just close this buffer
    vim.cmd [[
      BufferClose
    ]]
  end
end

function betterquit.setup(options)
  local command_opts = { force = true, bang = true }

  vim.api.nvim_create_user_command("CloseBufferOrQuit", function(opts)
    close_buffer_or_quit { bang = opts.bang }
  end, command_opts)

  vim.cmd [[
    function! s:in_ex_command(command)
      return (getcmdtype() == ':' && getcmdline() ==# a:command)
    endfunction

    cnoreabbrev <expr> q <SID>in_ex_command('q') ? 'CloseBufferOrQuit' : 'q'
  ]]

end

return betterquit
