require 'spec_helper'

#using IpInfo::API instanse for access to IpInfo::Request
describe IpInfo::API::Request do
  let(:address_url)  { 'devbattles.com'  }
	let(:address_ip) 	 { '64.233.191.255'  }
  let(:ip_info)      { IpInfo::API.new() }

  context "check #query params" do
    it "must be one param" do
      expect{ip_info.query()}.to raise_error(ArgumentError)
    end
    it "second param is optioanl", :vcr do  
      expect(ip_info.query(address_ip)).to be_kind_of(Hash)
    end
  end

  context "check #query response", :vcr do
    context "ip address" do
	    it "check valid ip address without params" do
	      expect(ip_info.query(address_ip)).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"64.233.191.255", :country_code=>"US", :country_name=>"United States"})
	    end

	    it "check valid ip address with city params" do
	      expect(ip_info.query(address_ip, type:'city')).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"64.233.191.255", :country_code=>"US", :country_name=>"United States", :region_name=>"California", :city_name=>"Mountain View", :zip_code=>"94043", :latitude=>"37.406", :longitude=>"-122.079", :time_zone=>"-07:00"})
	    end

	    it "check valid ip address with both params" do
        expect(ip_info.query(address_ip, type:'city', time_zone: true)).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"64.233.191.255", :country_code=>"US", :country_name=>"United States", :region_name=>"California", :city_name=>"Mountain View", :zip_code=>"94043", :latitude=>"37.406", :longitude=>"-122.079", :time_zone=>"-07:00"})
	    end
    end
    context "url address" do
	    it "check valid url address without params" do
        expect(ip_info.query(address_url)).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"104.236.167.162", :country_code=>"US", :country_name=>"United States"})
	    end

	    it "check valid url address with city params" do
        expect(ip_info.query(address_url, type:'city')).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"104.236.167.162", :country_code=>"US", :country_name=>"United States", :region_name=>"California", :city_name=>"San Francisco", :zip_code=>"94102", :latitude=>"37.7749", :longitude=>"-122.419", :time_zone=>"-07:00"})
	    end

	    it "check valid url address with both params" do
        expect(ip_info.query(address_url, type:'city', time_zone: true)).to eq({:status_code=>"OK", :status_message=>"", :ip_address=>"104.236.167.162", :country_code=>"US", :country_name=>"United States", :region_name=>"California", :city_name=>"San Francisco", :zip_code=>"94102", :latitude=>"37.7749", :longitude=>"-122.419", :time_zone=>"-07:00"})
	    end
    end
    context "invalid response" do
      it "ip address" do
        expect{ip_info.query("invalid ip")}.to raise_error(ArgumentError)
      end
      it "url address" do
        expect{ip_info.query("invalid url")}.to raise_error(ArgumentError)
      end
    end
  end
end
