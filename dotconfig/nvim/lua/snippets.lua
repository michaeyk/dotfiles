-- some shorthands...
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

local date = function() return {os.date('%Y-%m-%d')} end

ls.snippets = {
    all = {
        s("date", {
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD"
        }),
    }
}

