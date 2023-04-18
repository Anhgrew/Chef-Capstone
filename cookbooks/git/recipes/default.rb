#
# Cookbook:: git
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
case node['platform_family']
when 'debian'
  apt_package 'git' do
    action :install
  end
when 'mac_os_x'
  build_essential 'git' do
    compile_time true
    action :install
  end
else
  raise 'unsupported platform'
end
