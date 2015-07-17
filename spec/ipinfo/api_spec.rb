require 'spec_helper'

describe IpInfo::API do
	let(:ip) 					 { 'devbattles.com'  }
  let(:ip_info)      { IpInfo::API.new() }

  it "set api_key", :vcr do
  	expect(ip_info.api_key).to eq(ENV["IP_INFO_KEY"])
  end

  it "raise errors with empty api_key", :vcr  do  	
    expect{IpInfo::API.new(nil)}.to raise_error(ArgumentError)
  end

  it "check type of request", :vcr do    
    expect(ip_info.lookup(ip)).to be_kind_of(Hash)
  end
end
