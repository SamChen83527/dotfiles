local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end


-- shorcut to source my luasnips file again, which will reload my snippets
vim.api.nvim_set_keymap("n", "<M-h>", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>", {})

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({ "i", "s" }, "<c-k>", function()
--   if luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   end
-- end, { silent = true })

luasnip.config.set_config({
  -- This tells Luasnip to remember to keep around the last snippet.
  -- You can jump bakc into it even if you move outside of the selection
  history = true,
  -- This one is cool cause if you have dynamic snippets, it updates as you type.
  updateevents = "TextChanged,TextChangedI",
  -- Autosnippets
  enable_autosnippets = true,
})

-- This is a snippet creator
-- s(<trigger>, <nodes>)
local s = luasnip.s
-- This is a format node
-- It takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt
-- This is an insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default text])
local i = luasnip.insert_node
-- Repeats a node
-- rep(<position>)
local rep = require("luasnip.extras").rep

luasnip.snippets = {
  lua = {
    s("req", fmt("local {} = require('{}')", {i(1, "default"), rep(1)})),
  },
  cpp = {
    s("hp",
      fmt(
        [[
          #ifndef _{}_H_
          #define _{}_H_

          #ifdef __cplusplus
          extern "C"{{
          #endif


          #ifdef __cplusplus
          }}
          #endif

          #endif //_{}_H_
        ]],
        {
          i(1, "default"),
          rep(1), rep(1)
        }
      )
    ),
    s("cwmdcl",
      fmt(
        [[
          void cwm_{}_version(int *version);

          void cwm_{}_memsize(void *mem);

          void cwm_{}_init(void *mem);

          void cwm_{}_enable(void *mem);

          void cwm_{}_disable(void *mem);

          void cwm_{}_set_config(void *mem,  *config, int algo_id);

          void cwm_{}_get_config(void *mem,  *config, int algo_id);
        ]],
        {
          i(1, "default"),
          rep(1), rep(1), rep(1), rep(1), rep(1), rep(1),
        }
      )
    ),
  },
}

