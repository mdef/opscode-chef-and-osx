#
# Cookbook Name:: mozilla_thunderbird
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#wget "http://download.mozilla.org/?product=thunderbird-11.0&os=osx&lang=en-US"
#link for latest
#http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/latest/mac/en-GB/Thunderbird 12.0.dmg

#Get installed version of application
#system_profiler SPApplicationsDataType | grep "Get Info String: Thunderbird" | grep -oh '[0-9]*\.[0-9]*'

directory "/Applications/Thunderbird.app/" do
recursive true
action :delete
end


dmg_package "Thunderbird" do
    source "http://download.mozilla.org/?product=thunderbird-12.0&os=osx&lang=en-US"
    #        checksum "a3fae60b6833175f32df20c90cd3a3603a"
    action :install
end
