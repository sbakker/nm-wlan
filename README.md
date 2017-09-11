# nm-wlan - NetworkManager WLAN scripts

A few scripts to handle Wifi connections on a laptop.

# Scripts

## /etc/NetworkManager/dispatcher.d/99-wlan

Usage: **99-wlan** *IFACE* *ACTION*

 * Disable WiFi when a wired connection comes up.
 * Re-enable WiFi when the wired connection goes down again.
 * When a WiFi connection `CONN_NAME` comes up, run `wlan-up.d/CONN_NAME` if it exists.

Triggered by *any* wired interface, so really only useful for laptops with one interface.

## /etc/NetworkManager/dispatcher.d/wlan-up.d/default

Default script to run if a WiFi connection comes up and there is no explicit script for the network.

## /etc/NetworkManager/dispatcher.d/wlan-up.d/scripts/disable_ipv6.sh

Usage: **disable_ipv6** [*IFACE* [*ACTION* [*CONN_NAME*] ] ]

Helper script to disable IPv6 on the given interface.

# Installation

Install the `dispatcher.d` files in `/etc/NetworkManager/dispatcher.d`, owned by `root`.

```
rsync -av dispatcher.d/ /etc/NetworkManager/dispatcher.d/
chown -R root: /etc/NetworkManager/dispatcher.d
```

# Usage

The `99-wlan` should get called automatically.

To execute custom actions for when a WiFi network `FOO` comes up, create a script in `/etc/NetworkManager/wlan-up.d/FOO`. For example, if you want to disable IPv6 on network `FOO`:

```
sudo dd of=/etc/NetworkManager/wlan-up.d/FOO <'EOF'
#!/bin/sh

disable_ipv6.sh "$@"
EOF
sudo chmod +x /etc/NetworkManager/wlan-up.d/FOO
sudo chown root: /etc/NetworkManager/wlan-up.d/FOO
```
