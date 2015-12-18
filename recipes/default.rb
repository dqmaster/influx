#cookbook Name:: influxbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
remote_file "/tmp/influxdb-0.9.5.1-1.x86_64.rpm" do
  source 'http://influxdb.s3.amazonaws.com/influxdb-0.9.5.1-1.x86_64.rpm'
  mode '0755'
  action :create
end

yum_package 'influxRPM' do
  action :install
  source "/tmp/influxdb-0.9.5.1-1.x86_64.rpm"  
end

service 'influxdb' do
  action [:enable, :start]
end