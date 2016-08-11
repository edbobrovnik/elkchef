#
# Cookbook Name:: marvel
# Recipe:: default
# 
# https://www.elastic.co/guide/en/marvel/current/installing-marvel.html
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'install-marvel-license' do
 cwd '/usr/share/elasticsearch'
 command 'bin/plugin install license'
 user 'root'
 not_if do ::File.exist?('/usr/share/elasticsearch/plugins/license') end
end

execute 'install-marvel-agent' do
 cwd '/usr/share/elasticsearch'
 command 'bin/plugin install marvel-agent'
 user 'root'
 not_if do ::File.exist?('/usr/share/elasticsearch/plugins/marvel-agent') end
end

execute 'install-marvel-into-kibana' do
  cwd '/opt/kibana'
  command 'bin/kibana plugin --install elasticsearch/marvel/2.3.3'
  user 'root'
  not_if do ::File.exist?('/opt/kibana/installedPlugins/marvel') end
  notifies :stop, 'service[elasticsearch]', :before
  notifies :stop, 'service[kibana]', :before
  notifies :start, 'service[elasticsearch]', :delayed
  notifies :start, 'service[kibana]', :delayed
end

