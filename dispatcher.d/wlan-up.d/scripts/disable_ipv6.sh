#!/bin/sh
#
#   disable_ipv6.sh - Turn off IPv6 on broken networks
#
#   Copyright (C) 2017  Steven Bakker
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# disable_ipv6.sh IFACE ACTION CONN_NAME
#
#   Disable IPv6 on (broken) networks.
#

IFACE=$1

sysctl -w "net/ipv6/conf/$IFACE/disable_ipv6=1"
