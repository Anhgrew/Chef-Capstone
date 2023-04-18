#
# Cookbook:: atom
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
  apt_repository 'atom-ppa' do
    uri 'ppa:webupd8team/atom'
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key 'C2518248EEA14886'
  end

  package 'atom' do
    action :install
    options '--allow-downgrades --allow-unauthenticated'
  end


when 'mac_os_x'
  zip_app_package 'atom' do
    source 'https://github.com/atom/atom/releases/download/v1.12.9/atom-mac.zip'
  end

else
  raise 'unsupported platform'
end
