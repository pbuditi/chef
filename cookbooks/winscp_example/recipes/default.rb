#
# Cookbook Name:: winscp_example
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


node["sftp-folders"].each do |folderkey, folderval|
	folderName = "#{folderval}"
	directory folderName do
		mode "0755"
		recursive true
	end
end
	
template "#{node["sftp-folders"]["bin"]}/remotesftp.bat" do
	source "remoteftp.erb"
#	rights :read, 'Everyone'
#   rights :full_control, 'Administrators'
		variables(
				:ftpuser => "#{node["sftp"]["user"]}",
				:ftppwd => "#{node["sftp"]["password"]}",
				:ftppath => "#{node["sftp"]["target"]}",
				:ftpserver => "#{node["sftp"]["server"]}",
				:sftp_home => "#{node["sftp-home"]}"
			)
end

template "#{node["sftp-folders"]["bin"]}/autocleanup.bat" do
	source "autocleanup.erb"
#	rights :read, 'Everyone'
#   rights :full_control, 'Administrators'
end


# create windows scheduler if it doesn't eist already
#execute 'schtasks' do
#	command 'schtasks /create /sc minute /mo 30 /tr #{node["sftp-folders"]["bin"]}/cleanupsftp.bat /tn #{schedule_task}'
#	not_if 'schtasks /query /tn #{schedule_task} /NH /FO CSV'
#end