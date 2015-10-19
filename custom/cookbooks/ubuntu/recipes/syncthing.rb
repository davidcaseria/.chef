#
# Cookbook Name:: ubuntu
# Recipe:: syncthing
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute

bash 'add_syncthing_apt' do
  code <<-EOH
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo deb http://apt.syncthing.net/ syncthing release | sudo tee /etc/apt/sources.list.d/syncthing-release.list
    sudo apt-get update
  EOH
  not_if { system("which syncthing > /dev/null 2>&1") }
end

apt_package 'syncthing'

supervisor_service 'syncthing' do
  action :enable
  autostart true
  autorestart true
  command "#{`which syncthing`.delete!("\n")} -no-browser -home=\"#{Dir.home(node[:user])}/.config/syncthing\""
  process_name 'syncthing'
  directory Dir.home(node[:user])
  user node[:user]
  environment :STNORESTART => "1", :HOME => Dir.home(node[:user])
end
