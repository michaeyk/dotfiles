from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"  # "Windows" key
terminal = "kitty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows
    Key(
        [mod, "shift"], 
        "h", 
        lazy.layout.shuffle_left(), 
        desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Resize Windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Reset window size
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes

    Key([mod, "shift"], "space", lazy.layout.flip(), desc="Flip sides"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Browser
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod], "o", lazy.spawn("obsidian"), desc="Launch Obsidian"),
    Key([mod], "space", lazy.layout.next()),
    # Application launcher
    Key([mod], "r", lazy.spawn("rofi -combi-modi drun,ssh,emoji -show combi"), desc="Launch Application Launcher"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Close current window
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    # Media Keys
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        desc="Lower volume",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        desc="Raise volume",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc="Mute volume",
    ),
    Key(
        [],
        "XF86AudioPlay",
        lazy.spawn("playerctl play-pause"),
        desc="Play or pause music",
    ),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next track"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Previous track"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Stop track"),
    # Screen brightness
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl set +5%"),
        desc="Raise screen brightness",
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl set 5%-"),
        desc="Lower screen brightness",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("rofi -show calc -modi calc -no-show-match -no-sort"),
        desc="Calculator",
    ),
    # Take a selection screenshot
    Key(["shift"], "Print", lazy.spawn("grimshot save area /tmp/screenshot.png && /home/mike/bin/screenshot.sh"), 
        desc="Take a selection screenshot"),
    Key(["control"], "Print", lazy.spawn("grimshot copy area /tmp/screenshot.png"), desc="Take a selection screenshot"),
    # Lock computer
    # Qtile controls
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "z", lazy.spawn("systemctl suspend"), desc="Suspend"),
]


# Define keys to toggle the dropdown terminals
keys.extend([
    Key([mod], "u", lazy.group["scratchpad"].dropdown_toggle("term")),
])
