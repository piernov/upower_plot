upower_plot
===========

Scripts for battery stats plot generation using UPower and GNUPlot

`upower-plot.service` must be placed in `/etc/systemd/system`
`script_batt.sh` must be placed in `/etc/systemd`
`gnu-plot.sh` goes wherever you want

Run `systemd enable upower-plot` to enable the service at boot.
Run `systemd start upower-plot` to start it immediately.

`script_batt.sh` will parse output of `upower -i /org/freedesktop/UPower/devices/battery_BAT1` and create `/etc/systemd/upower-plot.csv` with a new line each 5 seconds.
By default, `upowerd` update the stats only each 30 or 120 seconds.  The http://github.com/piernov/upower repo enables upower updating stats every 5 seconds.

When you have enough line in /etc/systemd/upower-plot.csv, you can generate `out.pdf` by running `gnu-plot.sh`.
