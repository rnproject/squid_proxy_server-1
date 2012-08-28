#!/bin/sh -e

# generate metadata.json for upstream opscode cookbooks that have no metadata.json
knife cookbook metadata collectd -o cookbooks/
knife cookbook metadata collectd_plugins -o cookbooks/
knife cookbook metadata cron -o cookbooks/
knife cookbook metadata ntp -o cookbooks/
#knife cookbook metadata squid -o cookbooks/