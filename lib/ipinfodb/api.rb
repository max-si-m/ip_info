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
    
    # Using for adding adding api_key for requests
    # API_KEY you can get from: http://ipinfodb.com/account.php
    #
    # It takes one arguments:
    # * +api_key+: string of api_key 
    #
    # ==== Example:
    #   ip_info = Ipinfodb::API.new('<api_key>')   
    def initialize(api_key = nil)
      self.api_key ||= api_key 
    end
    
    # Retreive the remote location of a given ip address.
    #
    # It takes two optional arguments:
    # * +type+: can either be +:country+ (default) or +:city+
    # * +timezone+: can either be +false+ (default) or +true+
    #
    # ==== Example:
    #   ip_info.lookup('209.85.227.104', type: 'city', timezone: true)
    def lookup(ip, options = {})
      raise ApiKeyError.new("Error! Add your API key") if self.api_key.nil?
      query(ip, options)
    end

  end
end
