from libqtile.config import Screen
from libqtile import bar
from widgets import widgets

screens = [
    Screen(
        wallpaper = "~/.config/qtile/wallpaper",
        wallpaper_mode = "fill",
        top=bar.Bar(
            widgets,
            24,
            background="#00000000",
            margin=[2, 0, 0, 0],
        ),
    ),
]
