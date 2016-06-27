#
# Cookbook Name:: erlang
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
erlang_deps = %w(gcc gcc-c++ make libxslt fop ncurses-devel openssl-devel java-1.8.0-openjdk-devel unixODBC unixODBC-devel)

erlang_deps.each do |pkg|
  package pkg do
    action :install
  end
end


erlang_version     = node['erlang']['source']['version']
erlang_url         = node['erlang']['source']['url'] || "http://erlang.org/download/otp_src_#{erlang_version}.tar.gz"
erlang_checksum    = node['erlang']['source']['checksum']
erlang_build_flags = node['erlang']['source']['build_flags']
erlang_cflags      = node['erlang']['source']['cflags']

bash 'install-erlang' do
  cwd '/tmp'
  code <<-EOH
    wget #{erlang_url}
    tar -xzf otp_src_#{erlang_version}.tar.gz
    cd otp_src_#{erlang_version} 
    environment 'LANG' => 'C'
    ./configure
    make
    make install
  EOH
end