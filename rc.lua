-- Standard awesome library

gears 	        = require("gears")
awful           = require("awful")
awful.rules     = require("awful.rules")
awful.autofocus = require("awful.autofocus")
wibox           = require("wibox")
beautiful       = require("beautiful")
naughty         = require("naughty")
vicious         = require("vicious")
scratch         = require("scratch")

-- }} 

-- {{{ Commands 
-- }}}

-- {{{ Autostart

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end 

-- awful.util.spawn_with_shell("urxvtc -name irc -e ssh xubi -t tmux attach -d")
-- awful.util.spawn_with_shell("urxvtc -name mutt -e mutt")
-- awful.util.spawn_with_shell("urxvtc -name dev")
-- awful.util.spawn_with_shell("chromium")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}


-- {{{ Variable Definitions

-- Useful Paths
home = os.getenv("HOME")
confdir = home .. "/.config/awesome"
scriptdir = confdir .. "/scripts/"
themes = confdir .. "/themes"
active_theme = themes .. "/multicolor"

-- Themes define colours, icons, and wallpapers
beautiful.init(active_theme .. "/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc -name term"
editor = os.getenv("EDITOR") or "gvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,             -- 1
    awful.layout.suit.tile,                 -- 2
    awful.layout.suit.tile.left,            -- 3
    awful.layout.suit.tile.bottom,          -- 4
    awful.layout.suit.tile.top,             -- 5
    awful.layout.suit.fair,                 -- 6
    awful.layout.suit.fair.horizontal,      -- 7
    -- awful.layout.suit.spiral,             
    -- awful.layout.suit.spiral.dwindle,    
    awful.layout.suit.max,                  -- 8
    --awful.layout.suit.max.fullscreen,     
    --awful.layout.suit.magnifier          
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

--{{{ Tags
-- Define a tag table which will hold all screen tags.
tags = {                                                                                                                                                                                      
  names  = { "www", "@", "dev", "irc", "media", "term", "misc" },
  layout = { layouts[6], layouts[6], layouts[2], layouts[6], layouts[1],
  layouts[2], layouts[2] }
}
for s = 1, screen.count() do
  -- Each screen has its own tag table.
  tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
-- myaccessories = {
--    { "archives", "7zFM" },
--    { "charmap", "gucharmap" },
--    { "gbdfed", "gbdfed" },
--    { "gimp", "gimp" },
--    { "text editor", gui_editor },
-- }
-- myinternet = {
--     { "chromium" , "chromium" },
--     { "mail" , "mutt" },
--     { "irc" , "irc" },
-- }

myoffice = {
    { "writer" , "lowriter" },
    { "impress" , "loimpress" },
}
-- mysystem = {
--     { "appearance" , "lxappearance" },
--     { "cleaning" , "bleachbit" },
--     { "powertop" , terminal .. " -e sudo powertop " },
-- }
-- mymainmenu = awful.menu({ items = {
-- 				    { "accessories" , myaccessories },
-- 				    { "internet" , myinternet },
-- 				    { "office" , myoffice },
-- 				    { "system" , mysystem },
--             }
--             })
-- mylauncher = awful.widget.launcher({ menu = mymainmenu })


myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}
mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal },
	                                  { "internet" , myinternet },
	                                  { "office" , myoffice },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- {{{ Wibox

-- Colours
coldef  = "</span>"
colwhi  = "<span color='#b2b2b2'>"
colbwhi = "<span color='#ffffff'>"
blue = "<span color='#7493d2'>"
yellow = "<span color='#e0da37'>"
purple = "<span color='#e33a6e'>"
lightpurple = "<span color='#eca4c4'>"
azure = "<span color='#80d9d8'>"
green = "<span color='#87af5f'>"
lightgreen = "<span color='#62b786'>"
red = "<span color='#e54c62'>"
orange = "<span color='#ff7100'>"
brown = "<span color='#db842f'>"
fuchsia = "<span color='#800080'>"
gold = "<span color='#e7b400'>"
gray = "<span color='#c0c0c0'>"

-- Textclock widget
clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.widget_clock)
mytextclock = awful.widget.textclock("<span color='#7788af'>%A %d %B</span> " .. blue .. "</span><span color=\"#343639\">></span> <span color='#de5e1e'>%H:%M</span> ")

-- Calendar attached to the textclock
local os = os
local string = string
local table = table
local util = awful.util

char_width = nil
text_color = theme.fg_normal or "#FFFFFF"
today_color = theme.fg_focus or "#00FF00"
calendar_width = 21

local calendar = nil
local offset = 0

local data = nil

local function pop_spaces(s1, s2, maxsize)
   local sps = ""
   for i = 1, maxsize - string.len(s1) - string.len(s2) do
      sps = sps .. " "
   end
   return s1 .. sps .. s2
end

local function create_calendar()
   offset = offset or 0

   local now = os.date("*t")
   local cal_month = now.month + offset
   local cal_year = now.year
   if cal_month > 12 then
      cal_month = (cal_month % 12)
      cal_year = cal_year + 1
   elseif cal_month < 1 then
      cal_month = (cal_month + 12)
      cal_year = cal_year - 1
   end

   local last_day = os.date("%d", os.time({ day = 1, year = cal_year,
                                            month = cal_month + 1}) - 86400)
   local first_day = os.time({ day = 1, month = cal_month, year = cal_year})
   local first_day_in_week =
      os.date("%w", first_day)
   local result = "su mo tu we th fr sa\n"
   for i = 1, first_day_in_week do
      result = result .. "   "
   end

   local this_month = false
   for day = 1, last_day do
      local last_in_week = (day + first_day_in_week) % 7 == 0
      local day_str = pop_spaces("", day, 2) .. (last_in_week and "" or " ")
      if cal_month == now.month and cal_year == now.year and day == now.day then
         this_month = true
         result = result ..
            string.format('<span weight="bold" foreground = "%s">%s</span>',
                          today_color, day_str)
      else
         result = result .. day_str
      end
      if last_in_week and day ~= last_day then
         result = result .. "\n"
      end
   end

   local header
   if this_month then
      header = os.date("%a, %d %b %Y")
   else
      header = os.date("%B %Y", first_day)
   end
   return header, string.format('<span font="%s" foreground="%s">%s</span>',
                                theme.font, text_color, result)
end

local function calculate_char_width()
   return beautiful.get_font_height(theme.font) * 0.555
end

function hide()
   if calendar ~= nil then
      naughty.destroy(calendar)
      calendar = nil
      offset = 0
   end
end

function show(inc_offset)
   inc_offset = inc_offset or 0

   local save_offset = offset
   hide()
   offset = save_offset + inc_offset

   local char_width = char_width or calculate_char_width()
   local header, cal_text = create_calendar()
   calendar = naughty.notify({ title = header,
                               text = cal_text,
                               timeout = 0, hover_timeout = 0.5,
                            })
end

mytextclock:connect_signal("mouse::enter", function() show(0) end)
mytextclock:connect_signal("mouse::leave", hide)
mytextclock:buttons(util.table.join( awful.button({ }, 1, function() show(-1) end),
                                     awful.button({ }, 3, function() show(1) end)))

-- Vicious weather widget
weathericon = wibox.widget.imagebox()
weathericon:set_image(theme.confdir .. "/widgets/dish.png")
weatherwidget = wibox.widget.textbox()
vicious.register(weatherwidget, vicious.widgets.weather,
    function (widget, args)
        if args["{tempf}"] == "N/A" then
            return "No Info"
        else
            return "" .. lightpurple .. args["{sky}"] .. " @ " .. args["{tempf}"] .. "°F" .. coldef .. ""
        end
    end, 1800, "KPDX" )

-- /home fs widget
fshicon = wibox.widget.imagebox()
fshicon:set_image(theme.confdir .. "/widgets/fs.png")
fshwidget = wibox.widget.textbox()
    vicious.register(fshwidget, vicious.widgets.fs,
    azure .. '${/ used_p}%' .. coldef, 620)

local infos = nil

function remove_info()
    if infos ~= nil then 
        naughty.destroy(infos)
        infos = nil
    end
end

function add_info()
    remove_info()
    local capi = {
		mouse = mouse,
		screen = screen
	  }
    local cal = awful.util.pread(scriptdir .. "dfs")
    cal = string.gsub(cal, "          ^%s*(.-)%s*$", "%1")
    infos = naughty.notify({
        text = string.format('<span font_desc="%s">%s</span>', "Terminus", cal),
      	timeout = 0,
        position = "top_right",
        margin = 10,
        height = 170,
        width = 585,
		  screen	= capi.mouse.screen
    })
end

fshwidget:connect_signal('mouse::enter', function () add_info() end)
fshwidget:connect_signal('mouse::leave', function () remove_info() end)

-- Uptime
uptimeicon = wibox.widget.imagebox()
uptimeicon:set_image(beautiful.widget_uptime)
uptimewidget = wibox.widget.textbox()
vicious.register(uptimewidget, vicious.widgets.uptime, brown .. "$2.$3" .. coldef)

-- GMail widget
mygmail = wibox.widget.textbox()
gmail_t = awful.tooltip({ objects = { mygmail },})
mygmailimg = wibox.widget.imagebox(beautiful.widget_gmail)
notify_shown = false
mailcount = 0
vicious.register(mygmail, vicious.widgets.gmail,
 function (widget, args)
  gmail_t:set_text(args["{subject}"])
  gmail_t:add_to_object(mygmail)
  notify_title = ""
  notify_text = ""
  mailcount = args["{count}"]
  if (args["{count}"] > 0 ) then
    if (notify_shown == false) then
      -- Italian localization
      -- can be a stub for your own localization
      if (args["{count}"] == 1) then
          notify_title = "You got a new mail"
          notify_text = '"' .. args["{subject}"] .. '"'
      else
          notify_title = "You got " .. args["{count}"] .. " new mails"
          notify_text = 'Last one: "' .. args["{subject}"] .. '"'
      end
      naughty.notify({
          title = notify_title,
          text = notify_text,
          timeout = 7,
          position = "top_left",
          icon = beautiful.widget_mail_notify,
          fg = beautiful.taglist_fg_focus,
          bg = "#060606"
      })
      notify_shown = true
    end
    return gray .. coldef .. colwhi .. args["{count}"] .. coldef .. " <span font='Tamsyn 5'> </span><span font='Tamsyn 3'> </span>"
  else
    notify_shown = false
    return ''
  end
end, 60)
mygmail:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(mail, false) end)))

-- CPU widget
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, purple .. "$1%" .. coldef, 3)
cpuicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(tasks, false) end)))

-- Temp widget
tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.widget_temp)
tempicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e sudo powertop ", false) end)
    ))
   tempwidget = wibox.widget.textbox()
   vicious.register(tempwidget, vicious.widgets.thermal, "<span color=\"#f1af5f\">$1°C</span>", 9, {"coretemp.0", "core"} )

-- Battery widget
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_batt)
batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, "$2", 1, "BAT0")

function batstate()

     local file = io.open("/sys/class/power_supply/BAT0/status", "r")

     if (file == nil) then
     	  return "Cable plugged"
     end

     local batstate = file:read("*line")
     file:close()

     if (batstate == 'Discharging' or batstate == 'Charging') then
          return batstate
     else
          return "Fully charged"
     end
end

batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat,
     function (widget, args)
          -- plugged
          if (batstate() == 'Cable plugged') then return "AC "
          -- critical
          elseif (args[2] <= 5 and batstate() == 'Discharging') then
               naughty.notify({
                    text = "Battery dead!",
                    title = "Critically low!",
                    position = "top_right",
                    timeout = 1,
                    fg="#000000",
                    bg="#ffffff",
                    screen = 1,
                    ontop = true,
               })
          -- low
          elseif (args[2] <= 10 and batstate() == 'Discharging') then
               naughty.notify({
                    text = "Connect to charger!",
                    title = "Low charge",
                    position = "top_right",
                    timeout = 1,
                    fg="#ffffff",
                    bg="#262729",
                    screen = 1,
                    ontop = true,
               })
          end
          return " " .. args[2] .. "% "
     end, 1, 'BAT0')

-- Volume widget
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)
volumewidget = wibox.widget.textbox()
vicious.register(volumewidget, vicious.widgets.volume, blue .. "$1%" .. coldef,  1, "Master")

-- Net widget
netdownicon = wibox.widget.imagebox()
netdownicon:set_image(beautiful.widget_netdown)
netdownicon.align = "middle"
netdowninfo = wibox.widget.textbox()
vicious.register(netdowninfo, vicious.widgets.net, green .. "${wlp3s0 down_kb}" .. coldef, 1)
netupicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)
netupicon.align = "middle"
netupinfo = wibox.widget.textbox()
vicious.register(netupinfo, vicious.widgets.net, red .. "${wlp3s0 up_kb}" .. coldef, 1)

-- Memory widget
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, yellow .. "$2M" .. coldef, 1)

-- MPD Widget
mpdwidget = wibox.widget.textbox()
mpdicon = wibox.widget.imagebox()
mpdicon:set_image(theme.confdir .. "/widgets/note.png")

vicious.register(mpdwidget, vicious.widgets.mpd,
function(widget, args)
	-- play
	if (args["{state}"] == "Play") then
		return red .. args["{Title}"] .. coldef .. colwhi .. " - " .. coldef .. colwhi  .. 
		args["{Artist}"] .. coldef
	-- pause
	elseif (args["{state}"] == "Pause") then
		return red .. "mpd</span>" .. colwhi .." paused</span>"
	-- stop
	elseif (args["{state}"] == "Stop") then
		return red .. "mpd</span>" .. colwhi .." stopped</span>"
	-- not running
	else
		return red .. "mpd</span>" .. colwhi .." off</span>"
	end
	end, 1)

-- Spacer
spacer = wibox.widget.textbox(" ")

-- }}}
-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mybottomwibox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    left_layout:add(mpdicon)
    left_layout:add(mpdwidget)

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(netdownicon)
    right_layout:add(netdowninfo)
    right_layout:add(spacer)
    right_layout:add(netupicon)
    right_layout:add(netupinfo)
    right_layout:add(spacer)
    right_layout:add(volicon)
    right_layout:add(volumewidget)
    right_layout:add(spacer)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(spacer)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(spacer)
    right_layout:add(fshicon)
    right_layout:add(fshwidget)
    right_layout:add(spacer)
    right_layout:add(uptimeicon)
    right_layout:add(uptimewidget) 
    right_layout:add(spacer)
    right_layout:add(weathericon)
    right_layout:add(weatherwidget)
    right_layout:add(spacer)
    right_layout:add(tempicon)
    right_layout:add(tempwidget)
    right_layout:add(spacer)
    right_layout:add(mygmailimg)
    right_layout:add(mygmail)
    right_layout:add(spacer)     
    right_layout:add(baticon)
    right_layout:add(batwidget)
    --right_layout:add(spacer)
    right_layout:add(clockicon)
    right_layout:add(mytextclock)


    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    -- Create the bottom wibox
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s, border_width = 0, height = 20 })
    --mybottomwibox[s].visible = false
            
    -- Widgets that are aligned to the bottom left
    bottom_left_layout = wibox.layout.fixed.horizontal()
    bottom_left_layout:add(spacer)
                        
    -- Widgets that are aligned to the bottom right
    bottom_right_layout = wibox.layout.fixed.horizontal()
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(mylayoutbox[s])
                                            
    -- Now bring it all together (with the tasklist in the middle)
    bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_left(bottom_left_layout)
    bottom_layout:set_middle(mytasklist[s])
    bottom_layout:set_right(bottom_right_layout)
    mybottomwibox[s]:set_widget(bottom_layout)
end

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Dropdown terminal
    awful.key({ modkey,	          }, "z",     function () scratch.drop(terminal) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- printscr
    awful.key({ }, "Print", function () awful.util.spawn("scrot -e 'mv $f ~/screenshots/ 2>/dev/null'") end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
                     -- tag = tags[1][7]} },
    { rule = { class = "URxvt" },
      properties = { opacity = 0.85 } }, 
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    -- { rule = { class = "Pinentry" },
    --   properties = { floating = true, tag = tags[1][2] } },
    { rule = { class = "Gimp" },
      properties = { floating = true } },
    { rule = { class = "Chromium" },
      properties = { tag = tags[1][1] } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][1] } },
    -- { rule = { instance = "mutt" }, 
    --   properties = { tag = tags[1][2] } },
    { rule = { instance = "dev" }, 
      properties = { tag = tags[1][3] } },
    { rule = { instance = "irc" }, 
      properties = { tag = tags[1][4] } },
    { rule = { class = "Spotify" }, 
      properties = { tag = tags[1][5] } },
    { rule = { class = "Vlc" }, 
      properties = { tag = tags[1][5] } },
    -- { rule = { instance = "term" }, 
    --   properties = { tag = tags[1][6] } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end

    awful.client.movetoscreen(c, mouse.screen)
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
