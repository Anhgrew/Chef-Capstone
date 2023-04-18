describe file('hello.txt') do
  it { should be_file }
  its('content') { should match('Anhgrew is here') }
end
