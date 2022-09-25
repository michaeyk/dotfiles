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

local entry = function(index)
  return f(function(arg)
    local position = arg[1][1]
    local supply_distal = tonumber(arg[2][1]) or 0.0
    local supply_proximal = tonumber(arg[3][1]) or 0.0
    local demand_proximal = tonumber(arg[4][1]) or 0.0
    local demand_distal = tonumber(arg[5][1]) or 0.0
    
    if(position == "Long")
    then
      width = demand_proximal - demand_distal
      entry = demand_proximal + (width * 0.10)
    else
      width = supply_distal - supply_proximal
      entry = supply_proximal - (width * 0.10)
    end
      
    return tostring(entry)
  end, {3,4,5,6,7})
end 

local stop = function(index)
  return f(function(arg)
    local position = arg[1][1]
    local supply_distal = tonumber(arg[2][1]) or 0.0
    local supply_proximal = tonumber(arg[3][1]) or 0.0
    local demand_proximal = tonumber(arg[4][1]) or 0.0
    local demand_distal = tonumber(arg[5][1]) or 0.0
    
    if(position == "Long")
    then
       width = demand_proximal - demand_distal
       stop = demand_distal - (width * 0.20)
    else
       width = supply_distal - supply_proximal
       stop = supply_distal + (width * 0.20)
    end
      
    return tostring(stop)
  end, {3,4,5,6,7})
end 

local take_profit = function(index)
  return f(function(arg)
    local position = arg[1][1]
    local supply_distal = tonumber(arg[2][1]) or 0.0
    local supply_proximal = tonumber(arg[3][1]) or 0.0
    local demand_proximal = tonumber(arg[4][1]) or 0.0
    local demand_distal = tonumber(arg[5][1]) or 0.0
    local target = tonumber(arg[6][1]) or 0.0
     
    if(position == "Long")
    then
      tp = ((target - demand_proximal) * 0.80) + demand_proximal
    else
      tp = supply_proximal - ((supply_proximal - target) * 0.80) 
    end
      
    return tostring(tp)
  end, {3,4,5,6,7,8})
end 

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

    markdown = {
      s("trade", fmt([[
      {} {}
      ### Symbol: {}
      ### Chart: 
      ![Chart]({})
      ### Direction: {} 
      | Zones             | Price        |
      |------------------ |--------------|
      | Supply Distal     |{}            |
      | Supply Proximal   |{}            |
      | Demand Proximal   |{}            |
      | Demand Distal     |{}            |
      ### Entry:
      {}
      ### Stop (zone + 20% zone):
      {}
      ### Target:
      {}
      ### Take Profit (80% of Target):
      {}
      ### Outcome:
      * [ ] Target Reached
      * [ ] Stopped  
      ### Notes: 
      ]], 
      { 
        f(date, {}), f(function(args) return args[1] end, {1}),
        i(1, "ES"),
        i(2),
        c(3, {t("Long"), t("Short")}),
        i(4),
        i(5),
        i(6),
        i(7),
        entry(index), 
        stop(index),
        i(8),
        take_profit(index),
      }))
    }, 
})

-- You can also use lazy loading so you only get in memory snippets of languages you use
require('luasnip/loaders/from_vscode').lazy_load { paths = {"~/.config/nvim/extra/snippets"} }

