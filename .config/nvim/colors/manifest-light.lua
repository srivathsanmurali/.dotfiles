
local status_ok, base16 = pcall(require, "base16-colorscheme")
if not status_ok then
  return
end

base16.setup({
	base00 = '#ffffff',
	base01 = '#e0e0e0',
	base02 = '#dbdbdb',
	base03 = '#777777',
	base04 = '#777777',
	base05 = '#444444',
	base06 = '#444444',
	base07 = '#444444',
	base08 = '#cf484c',
	base09 = '#e77a1f',
	base0A = '#00c19c',
	base0B = '#61b43b',
	base0C = '#808e2d',
	base0D = '#0079d6',
	base0E = '#a358b9',
	base0F = '#f96aba',
})

