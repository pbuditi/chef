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
				:ftppathOut => "#{node["sftp"]["target"]['outgoing']}",
				:ftppathIn => "#{node["sftp"]["target"]['incoming']}",
				:ftpserver => "#{node["sftp"]["server"]}",
				:sftp_home => "#{node["sftp-home"]}"
			)
end

template "#{node["sftp-folders"]["bin"]}/autocleanup.bat" do
	source "autocleanup.erb"
#	rights :read, 'Everyone'
#   rights :full_control, 'Administrators'
end


# create windows scheduler for cleanup
#execute 'schtasks' do
#	command 'schtasks /create /sc minute /mo 30 /tr #{node["sftp-folders"]["bin"]}/autocleanup.bat /tn #{node["schedule_task"]["autocleanup"]}'
#	not_if 'schtasks /query /tn #{node["schedule_task"]["autocleanup"]} /NH /FO CSV'
#end

# create windows scheduler for sftp
#execute 'schtasks' do
#	command 'schtasks /create /sc minute /mo 30 /tr #{node["sftp-folders"]["bin"]}/remotesftp.bat /tn #{node["schedule_task"]["remotesftp"]}'
#	not_if 'schtasks /query /tn #{node["schedule_task"]["remotesftp"]} /NH /FO CSV'
#end
