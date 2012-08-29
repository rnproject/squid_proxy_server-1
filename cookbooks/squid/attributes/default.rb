#
# Author:: Matt Ray <matt@opscode.com>
# Cookbook Name:: squid
# Attributes:: default
#
# Copyright 2012 Opscode, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['squid']['port'] = 3128
default['squid']['network'] = nil
default['squid']['timeout'] = "10"
default['squid']['opts'] = ""

default['squid']['config_dir'] =
case node["platform"]
  when "centos", "redhat", "suse", "fedora" then "/etc/squid"
  when "debian" then "/etc/squid"
  when "ubuntu"
    case node["platform_version"]
      when "12.04" then "/etc/squid3"
      else "/etc/squid"
    end
  else "/etc/squid"
end

default['squid']['cache_dir'] =
case node["platform"]
  when "centos", "redhat", "suse", "fedora" then "/etc/squid"
  when "debian" then "/etc/squid"
  when "ubuntu"
    case node["platform_version"]
      when "12.04" then "/var/spool/squid3"
      else "/var/spool/squid"
    end
  else "/var/spool/squid"
end

default['squid']['service_name'] = 
case node["platform"]
  when "centos", "redhat", "suse", "fedora" then "squid"
  when "debian" then "squid"
  when "ubuntu"
    case node["platform_version"]
      when "12.04" then "squid3"
      else "squid"
    end
  else "squid"
end

default['squid']['version'] =
case node["platform"]
  when "centos", "redhat", "suse", "fedora" then ""
  when "debian" then ""
  when "ubuntu"
    case node["platform_version"]
      when "12.04" then "31"
      else ""
    end
  else ""
end

default['squid']['logs_dir'] =
case node["platform"]
  when "centos", "redhat", "suse", "fedora" then "/var/log/squid"
  when "debian" then "/var/log/squid"
  when "ubuntu" then
    case node["platform_version"]
      when "12.04" then "/var/log/squid3"
      else "/var/log/squid"
    end
  else "/var/log/squid"
end

default['squid']['config_file'] = File.join(node['squid']['config_dir'], node['squid']['service_name'], '.conf')