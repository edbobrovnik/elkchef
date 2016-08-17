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

execute 'logstash_enable_kill_on_timeout' do
  command "sed -i '/^#KILL_ON_STOP_TIMEOUT=0$/s/#KILL_ON_STOP_TIMEOUT=0/KILL_ON_STOP_TIMEOUT=1/' /etc/sysconfig/logstash"
end

directory '/opt/logstash/.ssh' do
   owner 'logstash'
   owner 'logstash'
   mode '0755'
   action :create
end

cookbook_file '/opt/logstash/.ssh/id_rsa' do
  source 'id_rsa'
  mode '600'
  owner 'logstash'
  group 'logstash'
end

cookbook_file '/opt/logstash/.ssh/id_rsa.pub' do
  source 'id_rsa.pub'
  mode '600'
  owner 'logstash'
  group 'logstash'
end


service "logstash" do
  action [:enable, :restart]
end

