control 'ChefDK is installed' do
  describe file('/opt/chef-workstation/bin/chef') do
    it { should exist }
  end

  describe command('/opt/chef-workstation/bin/chef --version') do
    its('stdout') { should match(/Chef Workstation version: /) }
  end
end

control 'ChefDK is at least 1.1.16' do
  describe(chefdk_version) do
    its('major_version') { should be >= 1 }
    its('minor_version') { should be >= 1 }
    its('patch_version') { should be >= 16 }
  end
end
