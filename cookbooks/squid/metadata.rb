maintainer       "Opscode, Inc."
maintainer_email "matt@opscode.com"
license          "Apache 2.0"
description      "Installs/Configures squid as a simple caching proxy"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

%w{ debian ubuntu centos fedora redhat scientific suse}.each do |os|
  supports os
end

recipe "squid", "Installs and configures Squid caching proxy server."

attribute "squid/port",
  :display_name => "Squid Listen Port",
  :description => "The TCP port Squid runs and listens on (default: 56789).",
  :required => "optional",
  :default => "56789"
