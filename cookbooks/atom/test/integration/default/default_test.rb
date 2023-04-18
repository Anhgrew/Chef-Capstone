# Chef InSpec test for recipe atom::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end


if os.debian?
  describe package('atom') do
    it { should be_installed }
  end
end

if os.name == 'mac_os_x'
  describe file('/Applications/Atom.app') do
    it { should exist }
  end
end
