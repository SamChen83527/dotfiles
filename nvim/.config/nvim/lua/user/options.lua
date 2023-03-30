-- vim.cmd [[set path+=**]]
vim.cmd([[set grepprg=rg\ --vimgrep\ --smart-case\ --follow]])
vim.cmd("set whichwrap+=<,>,[,]")

local options = {
    -- file --
	backup = false, -- creates a backup file
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	swapfile = false, -- creates a swapfile
	undofile = true, -- enable persistent undo
    fileencoding = "utf-8", -- the encoding written to a file
	wrap = false, -- display lines as one long line
    -- clipboard --
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    -- search --
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	smartcase = true, -- smart case
    -- ui --
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	pumheight = 10, -- pop up menu height
	cmdheight = 1,
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	-- showtabline = 2,                         -- always show tabs
	laststatus = 3,
	colorcolumn = "100",
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	termguicolors = true, -- set term gui colors (most terminals support this)
    -- indentation --
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	smartindent = true,
    -- line number --
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
    -- scroll --
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
    -- misc --
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)
	inccommand = "split", -- show the effects of substitute
	mouse = "", -- disable mouse
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
