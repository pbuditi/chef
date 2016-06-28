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
	
template "#{node["sftp-folders"]["bin"]}\\remoteftp.bat" do
	source "remoteftp.erb"
	mode "0644"
		variables(
				:ftpuser => "#{node["sftp"]["user"]}",
				:ftppwd => "#{node["sftp"]["password"]}",
				:ftppath => "#{node["sftp"]["target"]}",
				:ftpserver => "#{node["sftp"]["server"]}"
			)
end


# create windows scheduler if it doesn't eist already
execute 'schtasks' do
	command 'schtasks /create /sc minute /mo 30 /tr #{node["sftp-folders"]["bin"]}/cleanupsftp.bat /tn #{schedule_task}'
	not if 'schtasks /query /tn #{schedule_task} /NH /FO CSV'
end