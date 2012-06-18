#
# Cookbook Name:: fusioninventory-osx
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# download a binary release

#remote_file "/tmp/fusioninventory-agent.tar.gz" do
#    source "http://prebuilt.fusioninventory.org/stable/macosx-intel/fusioninventory-agent_macosx-intel_2.2.0rc4-1.pkg.tar.gz"
#end

cookbook_file "/tmp/fusioninventory-agent.pkg.tar.gz" do
    source "fusioninventory-agent_macosx-intel_2.2.0rc4-1.pkg.tar.gz"
    mode 0755
    owner "root"
    group "wheel"
    only_if do ! File.exists?("/opt/fusioninventory-agent") end
end

execute "extract" do

#    command "tar zxf files/fusioninventory-agent_macosx-intel_2.2.0rc4-1.pkg.tar.gz"
command "tar zxf /tmp/fusioninventory-agent.pkg.tar.gz"
    cwd "/tmp"
    only_if do ! File.exists?("/opt/fusioninventory-agent") end
end

execute "install pkg" do

command "sudo installer -pkg /tmp/FusionInventory-Agent.pkg -target /"
    only_if do ! File.exists?("/opt/fusioninventory-agent") end
end

cookbook_file "/opt/fusioninventory-agent/agent.cfg" do
    source "agent.cfg"
    mode 0644
    owner "root"
    group "wheel"
    only_if do File.exists?("/opt/fusioninventory-agent/agent.cfg") end
end

cookbook_file "/Library/LaunchDaemons/org.fusioninventory.agent.plist" do
    source "org.fusioninventory.agent.plist"
    mode 0644
    owner "root"
    group "wheel"
    only_if do File.exists?("/Library/LaunchDaemons/org.fusioninventory.agent.plist") end
end
