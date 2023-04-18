# Capstone project - Chef

This cookbook installs and configures some packages: atom, chef-workstation, git, nginx
---
- [x] Requirements
# Install vagrant and virtualbox
# Install berks
```
gem install berkshelf
```

# Install chef-workstation

```
wget https://packages.chef.io/files/stable/chef-workstation/23.4.1032/ubuntu/22.04/chef-workstation_23.4.1032-1_amd64.deb

dpkg -i chef-workstation_23.4.1032-1_amd64.deb 
```
---

```
cd cookbooks/anhgrew
berks list # List all dependencies of cookbook
berks install # Install all dependencies of cookbook
kitchen test # Test cookbook capstone on Ubuntu 16.04 virtual machine with vagrant driver
```

---

# Install chef-workstation

wget https://packages.chef.io/files/stable/chef-workstation/23.4.1032/ubuntu/22.04/chef-workstation_23.4.1032-1_amd64.deb

dpkg -i chef-workstation_23.4.1032-1_amd64.deb 

# Chef command
chef-apply file.rb
inspec exec file.rb
cookstyle file.rb

# Kitchen command
# kitchen init --driver=kitchen-dokken --provisioner=dokken

File: kitchen.yml 
---
driver:
  name: dokken
  chef_version: latest

provisioner:
  name: dokken

transport:
  name: dokken

platforms:
  - name: centos73
    driver: 
      image: centos:7.3.1611

verifier:
  name: inspec

suites:
  - name: default
    run_list:
    attributes:

Command
kitchen create <name of kitchen list out> --log_level=debug

# Kitchen process commands:
kitchen create -> kitchen login -> kitchen converge -> kitchen verify -> kitchen test -> kitchen destroy 
# Install chef-client

https://docs.chef.io/chef_install_script/

chef-zero = chef-solo: run on in-mem local
chef-client -> default on many node servers

# Ohai - collect system log
# Ohai collect info command:
/opt/chef/bin/ohai memory/total -> get total_mem

# Chef commands
chef generate template/recipe/file <cookbook>

# Inspec harden framework checking docker node:
docker run -it -d --name test centos:7.3.1611 /bin/bash

git clone https://github.com/dev-sec/linux-baseline.git

--> Docker on local
inspec exec linux-baseline --target docker://test

-->VM node on Digital Ocean
inspec exec linux-baseline -t ssh://centos@167.99.69.96 --key-files ~/.ssh/id_rsa --sudo

--> Show clear output:
inspec exec linux-baseline -t ssh://centos@167.99.69.96 --key-files ~/.ssh/id_rsa --reporter=progress | documentation | json | html2


=====> Know more about inspec resource from shell: 
-> Command: inspec shell ----> help <resource>

controls = many describe + title + ...

# Check after execute on product: Using autdit cookbook 

# Berks command:
berks vendor => update all dependencies

# Run local: 
sudo chef-client --local-mode --config-option cookbook_path="$(pwd)/berks-cookbooks" --override-runlist chef-workstation

# chef-shell
node.attributes.sort.each { |k,v| p k }; nil

node.debug_value('ipaddress')

# Debug
- Add breakpoint: 
breakpoint 'beginning' do
  action :break
end

kitchen create debug
kitchen login debug
sudo /opt/chef/embedded/bin/gem install chef-zero

wget https://packages.chef.io/files/stable/chef-workstation/22.10.1013/ubuntu/16.04/chef-workstation_22.10.1013-1_amd64.deb

sudo dpkg -i chef-workstation_22.10.1013-1_amd64.deb 

/opt/chef/embedded/bin/chef-zero -d

cd /tmp/kitchen && sudo knife cookbook upload --all --config client.rb 

sudo chef-shell --client --config client.rb --override-runlist 'chef-workstation'

---> debug
run_chef
-> Next line: 
chef_run.step
chef_run.rewind

# Profile -> Calculate time: Can use ruby-prof and visualizing tool
-> Install ruby-prof
sudo /opt/chef/embedded/bin/gem install ruby-prof

exit && kc exec default -c 'cat /tmp/kitchen/cache/graph_profile.out'
