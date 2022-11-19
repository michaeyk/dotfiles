from libqtile.config import Key, Group
from libqtile.command import lazy
from keys import mod, keys, terminal
from workspaces import workspaces
from libqtile.config import ScratchPad, DropDown

groups = []
for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    layouts = workspace["layout"] if "layout" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout=layouts))
    keys.append(Key([mod], workspace["key"], lazy.group[workspace["name"]].toscreen()))
    keys.append(Key([mod, "shift"], workspace["key"], lazy.window.togroup(workspace["name"])))

# for i in range(connected_monitors):
#     keys.extend([Key([mod, "mod1"], str(i), lazy.window.toscreen(i))])

groups.append(
    ScratchPad(
        "scratchpad", [
            # Define a drop down terminal
            # it is placed in the upper third of the screen by default
            DropDown(
                "term",
                terminal + " --class='Terminal'",
                # height=0.50,
                # width=0.50,
                # x=0.25,
                # y=0.2,
            ),

        ]
    )
)
