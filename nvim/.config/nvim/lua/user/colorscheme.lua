-- enable the powerline fonts
-- vim.g.airline_powerline_fonts = 1
--vim.g.airline_theme = "onedark"

local colorscheme = "darkplus"
-- local colorscheme = "gruvbox-material"
-- local colorscheme = "gruvbox"
-- local colorscheme = "onedarker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
