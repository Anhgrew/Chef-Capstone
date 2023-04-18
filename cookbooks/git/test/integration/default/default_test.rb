# Chef InSpec test for recipe git::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
# describe port(80), :skip do
#   it { should_not be_listening }
# end

describe(command('git --version')) do
  its('stdout') { should match(/git version/) }
end

if os.debian?
  describe(package('git')) do
    it { should be_installed }
  end
end

if os.family == 'darwin'
  describe(command('pkgutil --pkg-info=com.apple.pkg.CLTools_Executables')) do
    its('exit_status') { should be 0 }
  end
end
