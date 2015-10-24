#
# Cookbook Name:: ubuntu
# Recipe:: scala
#
# Copyright 2015, David Caseria
#
# All rights reserved - Do Not Redistribute
#

remote_file '/opt/scala-2.11.7.deb' do
  source 'http://www.scala-lang.org/files/archive/scala-2.11.7.deb'
  action :create
end

dpkg_package 'scala-2.11.7' do
  source '/opt/scala-2.11.7.deb'
end

bash 'add_sbt_apt' do
  code <<-EOH
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
    sudo apt-get update
    EOH
  not_if { system("which sbt > /dev/null 2>&1") }
end

apt_package 'sbt'

