from libqtile.config import Drag, Click
from libqtile.command import lazy
from libqtile.backend.wayland.inputs import InputConfig
from keys import mod

wl_input_rules = {
    "type:touchpad": InputConfig(tap=True, tap_button_map="lrm")
}

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click(
        [mod],
        "Button2",
        lazy.window.bring_to_front()
    )
]
