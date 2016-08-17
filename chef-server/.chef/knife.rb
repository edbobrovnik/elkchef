# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "edb"
client_key               "#{current_dir}/edb.pem"
chef_server_url          "https://default-centos-71/organizations/finfactory"
cookbook_path            ["#{current_dir}/../../cookbooks"]
