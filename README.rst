================================
FreeCloud Deployment tool
================================

This tool installs openstack for clustors

Definisions
===============================
Manager node

-Chef Server
-PXE Boot Server
-IPMI Powermanagement

Node
- OpenStack Nodes

Installation
================================
1. git clone git@github.com:ntt-pf-lab/freecloud.git

2. Settings

- Modify bmc_mac_list 
(This file should contain list of mac and ips of IPMI port of Nodes)

- Modify node_list
(This file should contain list of mac and ips of Nodes)

- Modify freecloud/etc/dnsmasq.conf
Set ips for IPMI port and Node (#TODO write script which generates this conf based on bmc_mac_list and node_list)

3.Install
cd freecloud/tools
./install.sh (Installation script of manager node)

Tools
================================

- Power status of nodes
tools/power_status.sh

- Power on nodes
tools/power_on.sh

- Power off nodes
tools/power_off.sh

- Power reset nodes
tools/power_reset.sh



