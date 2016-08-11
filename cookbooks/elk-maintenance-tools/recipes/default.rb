#
# Cookbook Name:: elk-maintenance-tools
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template '/usr/local/bin/curator-remove-old-es-indicies.sh' do
   source 'curator-remove-old-es-indicies.sh.erb'
   mode '0777'
   owner 'root'
   group 'root'
end

cron 'curator_schedule' do
  minute '17'
  hour '20'
  day '*'
  weekday '*'
  month '*'
  user 'root'
  command '/usr/local/bin/curator-remove-old-elastic-indicies.sh  >> /var/log/elk-curator-cron.log 2>&1' 
end

