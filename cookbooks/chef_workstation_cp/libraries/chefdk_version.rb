class ChefdkVersion < Inspec.resource(1)
  name 'chefdk_version'

  def initialize
    chef_version_output = inspec.command('/opt/chef-workstation/bin/chef --version').stdout
    version = chef_version_output.match(/Chef Workstation version: (\d+\.\d+\.\d+)/)[1]
    puts version
    @major_version = version.split('.')[0]
    @minor_version = version.split('.')[1]
    @patch_version = version.split('.')[2]
  rescue StandardError
    return skip_resource "Can't find Chef Workstation"
  end

  def major_version
    @major_version.to_i
  end

  def minor_version
    @minor_version.to_i
  end

  def patch_version
    @patch_version.to_i
  end
end
