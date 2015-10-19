#
# Cookbook Name:: ubuntu
# Recipe:: default
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute
if node[:platform] == 'ubuntu'
  apt_package 'compizconfig-settings-manager'
  apt_package 'compiz-plugins-extra'
  apt_package 'chromium-browser'
  apt_package 'keepassx'
  apt_package 'konsole'
  apt_package 'kpcli'
  apt_package 'supervisor'

  include_recipe 'ubuntu::syncthing'
end
