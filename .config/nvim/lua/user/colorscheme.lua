-- https://gitlab.com/ali-lab/manifest-light
-- local colorscheme = "base16-tokyo-night-dark"
-- local colorscheme = "base16-one-light"
-- local colorscheme = "base16-catppuccin-macchiato"
local colorscheme = "base16-catppuccin-latte"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
