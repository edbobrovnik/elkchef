# elkchef
CHEF repo for installing/testing ELK in multinode environment

Test environment contains chef-server and chef nodes, brought up via test-kitchen/vagrant/virtualbox.
Chef-server login/pass: e../qwe.sd...

==========================
Bootstrapping chef server
see on the internet open-source chef server

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

#on the node
chef-client

