#
# Cookbook Name:: osx
# Recipe:: default
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute
#
if node[:platform] == 'mac_os_x'
  homebrew_tap 'caskroom/cask'
  homebrew_package 'caskroom/cask/brew-cask'
  homebrew_cask 'firefox'
  homebrew_cask 'google-chrome'
  homebrew_cask 'intellij-idea'
  homebrew_cask 'iterm2'
  homebrew_cask 'slack'
  homebrew_cask 'sourcetree'
  homebrew_cask 'spectacle'
  homebrew_cask 'spotify'
  homebrew_cask 'syncthing'
  homebrew_package 'neo4j'
  homebrew_package 'pgcli'
  homebrew_package 'redis'
  homebrew_package 'sbt'
  homebrew_package 'scala'
end
