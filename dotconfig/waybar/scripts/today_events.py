#!/usr/bin/env python
import subprocess

gcalcli_out = subprocess.run(["gcalcli", "--calendar", "Kim Family Calendar", "--calendar", "michaeyk@gmail.com", "--nocolor", "agenda"],
                     universal_newlines=True, stdout=subprocess.PIPE)

gcalcli_lines = [l.split() for l in gcalcli_out.stdout.splitlines()]

date = gcalcli_lines[1][:3]
gcalcli_lines[1] = gcalcli_lines[1][3:]

today_events = []
for entry in gcalcli_lines[1:]:
    if entry:
        today_events.append(entry)
    # else:
    #     break

for e in today_events:
    print(' '.join(e) + '\n')
