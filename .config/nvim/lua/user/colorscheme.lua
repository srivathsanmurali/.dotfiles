-- https://gitlab.com/ali-lab/manifest-light
local colorscheme = "base16-tokyo-night-dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
