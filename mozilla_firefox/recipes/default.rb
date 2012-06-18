#
# Cookbook Name:: mozilla_firefox
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


directory "/Applications/Firefox.app/" do
recursive true
action :delete
end


dmg_package "Firefox" do
    source "http://download.mozilla.org/?product=firefox-11.0&os=osx&lang=en-US"
#        checksum "a3fae60b6833175f32df20c90cd3a3603a"
            action :install
            end
