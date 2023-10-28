local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node

local types = require "luasnip.util.types"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

vim.keymap.set({ "i", "s" }, "<tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<s-tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- shortcut to source luasnips file, reload snippets
vim.keymap.set("n", "<leader>S", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

-- my snippets
ls.add_snippets("python", {
    s({ trig = '#', dscr = 'Ipython Cell' }, {
      t({'# %% ', ''}),
      -- insert code
      i(1, "code"),
    }),

    s({ trig = '#', dscr = 'Mardown Cell' }, {
      t({'# %% [markdown]', ''}),
      -- insert markdown
      t('# '),
      i(1, "markdown"),
    }),
})
