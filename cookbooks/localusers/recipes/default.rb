#
# Cookbook Name:: localusers
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

search(:users, "*:*").each do |data|
	user data["id"] do
		comment data["comment"]
		uid data["uid"]
		gid data["guid"]
		home data ["name"]
		shell data["shell"]

	end
end
include_recipe "localusers::groups"
