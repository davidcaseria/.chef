#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute
#
if node.attribute?('user')
  user = node[:user]
  home = Dir.home(user)

  # Get the current cookbook context
  cb = run_context.cookbook_collection[cookbook_name]

  # Copy files to home directory
  cb.manifest['files'].each do |file|
    path = file[:path][6..-1]
    cookbook_file "#{home}/#{path}" do
      source path
      owner user
      group user
      action :create
    end
  end
end
