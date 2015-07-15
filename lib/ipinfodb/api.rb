require "ipinfodb"

module Ipinfodb
  class API
    include HTTParty
    include Ipinfodb::API::Request
    include Ipinfodb::API::Parser

    class ApiKeyError < ArgumentError; end
   
    base_uri "http://api.ipinfodb.com/v3/ip-"
    format :json
    
    attr_accessor :api_key

    def initialize(api_key = nil)
      self.api_key ||= api_key 
    end

    def lookup(ip, options = {})
      raise ApiKeyError.new("Error! Add your API key") if self.api_key.nil?
      query(ip, options)
    end

  end
end
