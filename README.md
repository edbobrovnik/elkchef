# elkchef
CHEF repo for installing/testing ELK in multinode environment

Test environment contains chef-server and chef nodes, brought up via test-kitchen/vagrant/virtualbox.
Chef-server login/pass: e../qwe.sd...

==========================
Bootstrapping chef server
kitchen create
kitchen converge
192.168.19.80:80
http://misheska.com/blog/2014/11/25/chef-server-12/

kitchen role from file
kitchen environment from file

==========================
Bootstrapping a new node. (new dir)

kitchen init --create-gemfile
bundle install
kitchen create

update /etc/hosts on chef-server to include IPs of the newly created node
ping node from server
ping server from node

knife bootstrap --sudo --ssh-user vagrant --ssh-password vagrant --no-host-key-verify ${node_ip_add} -N ${node_name}

set role for the node
knife node run_list set ${node_name} "role[devserver]"
knife node environment set ${node_name} "dv0"

#on the node
chef-client


========================
Development, testing

kitchen create   #from chef-server, node-dv0, node-dv1
knife client list   # to ensure connection to chef server is up and running


