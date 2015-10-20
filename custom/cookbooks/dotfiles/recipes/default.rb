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

  git "clone_dotfiles" do
    repository "https://github.com/davidcaseria/dotfiles.git"
    destination "#{home}/.dotfiles"
    user user
    group (node['platform'] == 'ubuntu' ? user : 'staff')
  end

  execute "bootstrap_dotfiles" do
    command "./bootstrap.sh"
    environment ({'HOME' => home})
    cwd "#{home}/.dotfiles"
    user user
  end
end
