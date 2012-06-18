#
# Cookbook Name:: osx-update
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "set local update server" do
    command 'defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL “http://YOUR-UPDATE_SERVER_HERE:8088/index.sucatalog”;'
    action :run
end


cookbook_file "/tmp/notify.sysupdate.scpt" do
    source "notify.sysupdate.scpt" 
    mode "0644"
end

cookbook_file "/tmp/notify.sysupdate.reboot.scpt" do
    source "notify.sysupdate.reboot.scpt" 
    mode "0644"
end



if system("softwareupdate -l | grep restart")
Chef::Log.info("softwareupdate with reboot")
      execute "softwareupdate with reboot" do
          command '/usr/sbin/softwareupdate -v -i -a && /usr/bin/osascript /tmp/notify.sysupdate.reboot.scpt'
      action :run
    end
  else

	execute "softwareupdate without reboot" do
	    Chef::Log.info("softwareupdate without reboot")
	    command '/usr/sbin/softwareupdate -v -i -a /usr/bin/osascript /tmp/notify.sysupdate.scpt'
        action :run
	end
    end