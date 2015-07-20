require 'spec_helper'

#using IpInfo::API instanse for access to IpInfo::Parser
describe IpInfo::API::Parser do
  let(:ip_info) { IpInfo::API.new(api_key: ENV['IP_INFO_KEY']) }

  let(:response) do
  {
    "statusCode" => "OK",
    "statusMessage" => "",
    "ipAddress" => "64.233.191.255",
    "countryCode" => "US",
    "countryName" => "United States",
    "regionName" => "California",
    "cityName" => "Mountain View",
    "zipCode" => "94043",
    "latitude" => "37.406",
    "longitude" => "-122.079",
    "timeZone" => "-07:00"	
	}
  end

  context "check #parse_response params" do
    it "must return Hash" do
      res = ip_info.parse_response(response)
      expect(res).to be_kind_of(Hash)
    end

    it "raise error for bad data" do
      response["statusCode"] = "ERROR"
      response["statusMessage"] = "Some errors"

      expect{ip_info.parse_response(response)}.to raise_error(ArgumentError)
    end
  end

  context "check #convert_keys params" do
    it "convert array to hash" do
      res = ip_info.send('convert_keys',response)
      expect(res).to be_kind_of(Hash)
    end
    it "raise error for empty response" do
      expect{ip_info.send('convert_keys',nil)}.to raise_error(ArgumentError)
    end
  end
end
