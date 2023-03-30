local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- -- Add languages to be installed here that you want installed for treesitter
	-- ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "typescript", "help", "vim" },
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "" } },
	rainbow = {
		enable = false,
		colors = {
			"#68a0b0",
			"#946EaD",
			"#c7aA6D",
			-- "Gold",
			-- "Orchid",
			-- "DodgerBlue",
			-- "Cornsilk",
			-- "Salmon",
			-- "LawnGreen",
		},
	},
})
