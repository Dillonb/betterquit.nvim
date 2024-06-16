-- Ensure the plugin is only loaded once
if vim.g.betterquit_nvim_plugin_loaded == 1 then
  return
end

vim.g.betterquit_nvim_plugin_loaded = 1
