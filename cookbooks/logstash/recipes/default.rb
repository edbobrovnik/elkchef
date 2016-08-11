#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/etc/yum.repos.d/logstash.repo' do
  source 'logstash.repo'
end

yum_package 'logstash'

template '/etc/logstash/conf.d/logstash.conf' do
   source 'logstash.conf.erb' 
end

service "logstash" do
  action [:enable, :restart]
end

