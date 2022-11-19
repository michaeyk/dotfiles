import asyncio
import os
import subprocess
from libqtile import qtile
from libqtile import hook
from groups import groups
from libqtile.log_utils import logger

# AUTOSTART
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])

# Reload config on screen changes
@hook.subscribe.screens_reconfigured
async def outputs_changed():
    logger.warning("Screens reconfigured")
    await asyncio.sleep(1)
    logger.warning("Reloading config...")
    qtile.reload_config()

# When application launched automatically focus it's group

@hook.subscribe.client_new
def modify_window(client):
    for group in groups:  # follow on auto-move
        match = next((m for m in group.matches if m.compare(client)), None)
        if match:
            targetgroup = client.qtile.groups_map[group.name]  # there can be multiple instances of a group
            targetgroup.toscreen(toggle=False)
            break

