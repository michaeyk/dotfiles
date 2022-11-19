local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
})

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.choice_active() then
 ls.change_choice(-1)
 end
end)

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
    },

    mail = {
        s({
            trig = "best",
            namr = "Best Regards",
            dscr = "Best Regards Salutation",
        }, {
          t{"Best Regards,", "Mike"}, 
        }),

        s({
            trig = "kind",
            namr = "Kind Regards",
            dscr = "Kind Regards Salutation",
        }, {
          t{"Kind Regards,", "Michael Kim"}, 
        }),
    },
})

-- You can also use lazy loading so you only get in memory snippets of languages you use
require('luasnip/loaders/from_vscode').lazy_load { paths = {"~/.config/nvim/extra/snippets"} }

