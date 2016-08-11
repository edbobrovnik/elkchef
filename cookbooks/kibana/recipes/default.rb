#
# Cookbook Name:: kibana
# Recipe:: default
#
# Installation as described https://www.elastic.co/guide/en/kibana/current/setup.html
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/etc/yum.repos.d/kibana.repo' do
  source 'kibana.repo'
end

yum_package 'kibana'

template '/opt/kibana/config/kibana.yml'  do
   source 'kibana.yml.erb' 
end

service "kibana" do
  action [:enable, :restart]
end

#kibanatempdir = node["kibana"]["kibanatempdir"]

#directory kibanatempdir do
#  mode '0777'
#end

#include_recipe 'searches'
#include_recipe 'visualizations'
#include_recipe 'dashboards'

