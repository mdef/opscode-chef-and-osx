#
# Cookbook Name:: netbeans
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#TODO: check if app installed with system_profiler SPApplicationsDataType

dmg_package "NetBeans 7.1.1".gsub(/ /, "\\ ") do
    type "mpkg"
  dmg_name "netbeans-7.1.1-ml-macosx"
  volumes_dir "NetBeans 7.1.1".gsub(/ /, "\\ ")
    source "http://10.0.0.100/install/netbeans-7.1.1-ml-macosx.dmg"
#        checksum "a3fae60b6833175f32df20c90cd3a3603a"

action :install
only_if do ! File.exists?("/Applications/NetBeans/NetBeans 7.1.1.app/") end
end
