local opts = { noremap = true, silent = true }

local term_opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Switch header/source file
-- keymap("n", "<A-o>", ":lua require('user.switch').SwitchHeaderSource()<CR>", opts)
keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
-- Better window navigation
keymap({"n", "t"}, "<C-Left>", "<cmd>NavigatorLeft<CR>", opts)
keymap({"n", "t"}, "<C-Down>", "<cmd>NavigatorDown<CR>", opts)
keymap({"n", "t"}, "<C-Up>", "<cmd>NavigatorUp<CR>", opts)
keymap({"n", "t"}, "<C-Right>", "<cmd>NavigatorRight<CR>", opts)
-- Make adjusting split size a bit more friendly
keymap("n", "<S-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +3<CR>", opts)
keymap("n", "<S-Up>", ":resize +3<CR>", opts)
keymap("n", "<S-Down>", ":resize -3<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":Bdelete!<CR>", opts)
-- Navigate git chunk
-- keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
-- keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", opts)
-- Keep next/prev in middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- Yank all line from current position
keymap("n", "Y", "y$", opts)
-- Concatenate next line
keymap("n", "J", "mzJ`z", opts)
-- Replace all is aliased to S
-- keymap("n", "S", ":%s///gc<Left><Left><Left><Left>", term_opts)
keymap("n", "S", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<Left><Left><Left>", term_opts)
-- Split quick key
keymap("n", "<Leader>sv", ":vsp<space>", term_opts)
keymap("n", "<Leader>sh", ":sp<space>", term_opts)
-- Moving text
keymap("n", "<Leader><Up>", ":move .-2<CR>==", opts)
keymap("n", "<Leader><Down>", ":move .+1<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- Visual --
keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<tab>", ">gv", opts)
keymap("v", "<S-tab>", "<gv", opts)
-- Register --
keymap("x", "<leader>p", "\"_dP", opts)
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)

-- Telescope --
-- keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>?", "<cmd>Telescope old_files<CR>", opts)
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap("n", "<C-f>", function()
    local utils = require('telescope.utils')
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        require("telescope.builtin").git_files()
    else
        require("telescope.builtin").find_files()
    end
end, opts)

-- Nvimtree --
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Dap --
keymap("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)

-- JABS(Just Another Buffer Switcher) --
keymap("n", "=", "<cmd>JABSOpen<CR>", { noremap = true, silent = true, nowait = true })

-- Diffview --
keymap("n", "<Leader>do", ":DiffviewOpen<CR>", opts)
keymap("n", "<Leader>dc", ":DiffviewClose<CR>", opts)

-- Null-ls --
keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

