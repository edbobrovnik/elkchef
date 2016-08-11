#
# Cookbook Name:: kibana
# Recipe:: searches
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

seraches_json = node["kibana"]["kibanatempdir"] + '/searches.json'

template searches_json do
  source 'searches.json.erb'
end

execute 'import_kibana_searches' do 
  command ''
  action :nothing
end
