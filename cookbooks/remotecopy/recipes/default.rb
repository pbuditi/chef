#
# Cookbook Name:: remotecopy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/tmp/remotecopy.bat" do |variable|
	source "remotecopy.erb"
	variables( :user => 'test', :password => 'password', :ftp_server => 'server.com', :source => 'source-path', :source_file => 'source_file_path', :target => 'target dir')
end