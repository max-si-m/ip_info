# ./spec/groovehq/resource_spec.rb
require 'spec_helper'

describe IpInfo::API do
	let(:api_key) 		{ 'test api_key' }	
	let(:ip)					{ 'devbattles.com'}

  it "set api_key" do
  	ip_info = IpInfo::API.new(api_key)
  	expect(ip_info.api_key).to eq(api_key)
  end

  it "raise errors with empty api_key"  do  	
  	expect{IpInfo::API.new(nil)}.to raise_error(ArgumentError)
  end
end