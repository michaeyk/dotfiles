from libqtile import widget
from libqtile.command import lazy
from colors import catppuccin

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=30,
    padding=3,
    foreground=catppuccin["black1"],
)
extension_defaults = widget_defaults.copy()

widgets = [
    widget.Spacer(length=3, background="#00000000"),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["pink"],
        background="#00000000",
    ),
    widget.TextBox(
        text="異",
        mouse_callbacks={"Button1": lazy.spawn("rofi -show run")},
        background=catppuccin["pink"],
        foreground=catppuccin["black1"],
    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["pink"],
        background=catppuccin["red"],
    ),
    widget.CurrentLayoutIcon(
        padding=1,
        scale=0.8,
        foreground=catppuccin["black1"],
        background=catppuccin["red"],
        custom_icon_paths=["~/.config/qtile/icons/"],
    ),
    widget.CurrentLayout(background=catppuccin["red"], foreground=catppuccin["black1"]),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["red"],
        background=catppuccin["peach"],
    ),
    widget.GroupBox(
        highlight_method="line",
        background=catppuccin["peach"],
        highlight_color=[catppuccin["peach"], catppuccin["peach"]],
        other_screen_border=catppuccin["gray0"],
        other_current_screen_border=catppuccin["white"],
        this_current_screen_border=catppuccin["white"],
        this_screen_border=catppuccin["gray0"],
        inactive=catppuccin["black1"],
    ),
    widget.TextBox(
        text="", padding=0, fontsize=30, foreground=catppuccin["peach"]
    ),
    widget.WindowName(fontsize=16, foreground=catppuccin["white"]),
    widget.TextBox(text="", padding=0, fontsize=30, foreground=catppuccin["teal"]),
    widget.PulseVolume(
        fmt="墳 {}",
        volume_down_command="pactl set-sink-volume @DEFAULT_SINK@ -5%",
        volume_up_command="pactl set-sink-volume @DEFAULT_SINK@ +5%",
        mute_command="pactl set-sink-mute @DEFAULT_SINK@ toggle",
        limit_max_volume=True,
        mouse_callbacks={"Button2": lazy.spawn("/usr/bin/pavucontrol")},
        background=catppuccin["teal"],
        foreground=catppuccin["black1"],
    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["green"],
        background=catppuccin["teal"],
    ),
    widget.CryptoTicker(currency="USD",
                        background=catppuccin["green"],
                        foreground=catppuccin["black1"],
                        ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["yellow"],
        background=catppuccin["green"],
    ),
    widget.CryptoTicker(crypto="ETH", currency="USD",
                        background=catppuccin["yellow"],
                        foreground=catppuccin["black1"],
                        ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["peach"],
        background=catppuccin["yellow"],
    ),
    widget.Wlan(
        format=' {essid} {percent:2.0%}',
        interface="wlp0s20f3",
        mouse_callbacks={"Button1": lazy.spawn("/home/mike/bin/rofi-wifi-menu/rofi-wifi-menu.sh")},
        background=catppuccin["peach"],
        foreground=catppuccin["black1"],
    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["red"],
        background=catppuccin["peach"],
    ),
    widget.Clock(format=" %a %d %b %Y, %H:%M", 
                 mouse_callbacks={"Button1": lazy.spawn("rofi -show today -modes 'today:~/bin/today_events.py'")},
                 background=catppuccin["red"],
                 foreground=catppuccin["black1"],
                 ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["pink"],
        background=catppuccin["red"],
    ),
    widget.Battery(
        format="{char} {percent:2.0%}",
        charge_char="",
        discharge_char="",
        full_char="",
        unknown_char="",
        empty_char="",
        show_short_text=True,
        background=catppuccin["pink"],
        foreground=catppuccin["black1"],
    ),
    widget.Spacer(length=10, background=catppuccin["pink"]),
    widget.TextBox(
        text="",
        mouse_callbacks={
            "Button1": lazy.spawn("systemctl suspend"),
            "Button2": lazy.spawn("systemctl restart"),
            "Button3": lazy.spawn("systemctl poweroff"),
        },
        background=catppuccin["pink"],
        foreground=catppuccin["black1"],
    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["pink"],
        background="#00000000",
    ),
    widget.Spacer(length=3, background="#00000000"),
]
