local g = vim.g
-- g.t_co = 256
g.background = "light"

-- https://gitlab.com/ali-lab/manifest-light
local colorscheme = "manifest-light"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
