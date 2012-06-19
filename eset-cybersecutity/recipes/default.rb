#
# Cookbook Name:: eset-cybersecutity
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#TODO: check if app installed with system_profiler SPApplicationsDataType

cookbook_file "/tmp/eset_cybersecurity_en.dmg" do
	source "eset_cybersecurity_en.dmg"
	mode 0755
	owner "root"
	group "wheel"
only_if do ! File.exists?("/Applications/ESET Cybersecurity.app/") end
end



execute "ESET mounting" do

dmg_name = "eset_cybersecurity_en.dmg"
dmg_file = "#{Chef::Config[:file_cache_path]}/#{dmg_name}.dmg"
command  "hdid /tmp/eset_cybersecurity_en.dmg"
only_if do ! File.exists?("/Applications/ESET Cybersecurity.app/") end
end


execute "ESET installation" do

dmg_name = "eset_cybersecurity_en.dmg"
dmg_file = "#{Chef::Config[:file_cache_path]}/#{dmg_name}.dmg"
#command "hdid #{dmg_file}"
command "installer -pkg /Volumes/ESET\\ Cybersecurity/Resources/Install.pkg -target /"
#  not_if do "hdiutil info | grep -q 'image-path.*#{dmg_file}'" end
only_if do  File.exists?("/Volumes/ESET Cybersecurity/") end
end
