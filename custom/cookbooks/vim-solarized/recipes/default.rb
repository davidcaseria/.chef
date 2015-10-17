#
# Cookbook Name:: vim-solarized
# Recipe:: default
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute
#
directory '~/.vim/colors' do
  action :create
  recursive true
end

remote_file '~/.vim/colors/solarized.vim' do
  source 'https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim'
  action :create
end
