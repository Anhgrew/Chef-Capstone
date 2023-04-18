#
# Cookbook:: anhgrew
# Recipe:: default
#
# Copyright:: 2023, Anhgrew
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



cookbook_file '/etc/profile.d/motd.sh' do
  source 'motd.sh'
  mode '0755'
end

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end


node.default['anhgrew']['message'] = "Hi, I am Anhgrew"
include_recipe 'anhgrew::student'

case node['platform_family']

when 'rhel'
  package 'epel-release' do
    action :install
  end
# when 'debian'


# when 'mac_os_x'

end




package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end





template '/usr/share/nginx/html/index.html' do
  source 'index.html.erb'
  mode '0644'
end


include_recipe 'git'
include_recipe 'chef-workstation'
include_recipe 'atom'
