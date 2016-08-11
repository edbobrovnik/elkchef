#
# Cookbook Name:: elasticsearch
# Recipe:: default
# 
# Installation as described on https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file  '/etc/yum.repos.d/elasticsearch.repo' do
  source 'elasticsearch.repo'
end 

execute 'download-install-elasticsearch-key' do
  command 'rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch'
end

yum_package 'elasticsearch'

template '/etc/elasticsearch/elasticsearch.yml' do
   source 'elasticsearch.yml.erb'
end

directory '/vol/data/elasticsearch' do
  action :create
  recursive true 
  group 'elasticsearch'
  owner 'elasticsearch'
  mode '0755'
  not_if  do ::File.exist?('/vol/data/elasticsearch') end
end

directory '/vol/data/log' do
  action :create
  recursive true
  group 'elasticsearch'
  owner 'elasticsearch'
  mode '0755'
  not_if do ::File.exist?('/vol/data/log') end
end

service "logstash-stop" do
  service_name "logstash"
  action :stop
end

service "elasticsearch" do
  action [:enable, :restart]
end

service "logstash-start" do
  service_name "logstash"
  action :start
end

cookbook_file "#{Chef::Config['file_cache_path']}/logstash-template.json" do
   source 'logstash-template.json'
end

execute 'apply-logstash-template' do
  user 'root'
  retries 3
  retry_delay 
  #sleeping to let Elasticseach properly startup5
  command "sleep 10; curl -v -XPUT #{node['elasticsearch']['networkhost']}:9200/_template/logstash -d @#{Chef::Config['file_cache_path']}/logstash-template.json"
end


