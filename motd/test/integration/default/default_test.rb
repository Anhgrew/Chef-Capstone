# # Chef InSpec test for recipe motd::default

# # The Chef InSpec reference, with examples and extensive documentation, can be
# # found at https://docs.chef.io/inspec/resources/

# unless os.windows?
#   # This is an example test, replace with your own test.
#   describe user('root'), :skip do
#     it { should exist }
#   end
# end

# # This is an example test, replace it with your own test.
# describe port(80), :skip do
#   it { should_not be_listening }
# end

# describe file('/etc/motd') do
#   if
# end

describe file('/tmp/motd') do
  it { should be_file }
  its('content') { should match(/.+/) }
end

describe command('bash --login -i -c "cd ~"') do
  its('stdout') { should match('Cow Hanging') }
end
