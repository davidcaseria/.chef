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
  apt_package 'guake'
end
