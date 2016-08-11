#
# Cookbook Name:: elasticsearch-curator
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/etc/yum.repos.d/elasticsearch-curator.repo' do
  source 'elasticsearch-curator.repo'
end

yum_package 'python-elasticsearch-curator'



