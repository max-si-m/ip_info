require "ip_info"

module IpInfo
  class API
    include HTTParty
    include IpInfo::API::Request
    include IpInfo::API::Parser

    class ApiKeyError < ArgumentError; end

    base_uri "http://api.ipinfodb.com/v3/ip-"
    format :json

    attr_accessor :api_key
    
    # Using for adding adding api_key for requests
    # API_KEY you can get from: http://ipinfodb.com/account.php
    #
    # Constructor yields a block to allow more complicated object configuration.
    #
    # It takes options with single optional key:
    # * +api_key+: string of api_key 
    #
    # ==== Example:
    #   ip_info = IpInfo::API.new()   
    def initialize(options = {})
      yield self
      
      self.api_key ||= options.fetch(:api_key) { fail ApiKeyError.new("API key is missing.") }
    end
    
    # Retreive the remote location of a given ip address.
    #
    # It takes two optional arguments:
    # * +type+: can either be +:country+ (default) or +:city+
    # * +time_zone+: can either be +false+ (default) or +true+
    #
    # ==== Example:
    #   ip_info.lookup('209.85.227.104', type: 'city', time_zone: true)
    def lookup(ip, options = {})
      query(ip, options)
    end

  end
end
