#
# Cookbook:: motd
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
cookbook_file '/tmp/motd' do
  source 'motd'
  mode '0644'
end

cookbook_file '/etc/profile.d/motd.sh' do
  source 'motd.sh'
  mode '0755'
end
