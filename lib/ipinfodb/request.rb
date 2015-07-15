module Ipinfodb
  class API
    module Request
      class InvalidOptionsError < ArgumentError; end
      class InvalidIpError < ArgumentError; end

      IPV4_REGEXP = /\A(?:25[0-5]|(?:2[0-4]|1\d|[1-9])?\d)(?:\.(?:25[0-5]|(?:2[0-4]|1\d|[1-9])?\d)){3}\z/
      
      def query ip, options
        raise InvalidIpError.new(ip) unless ip.to_s =~ IPV4_REGEXP
        raise InvalidOptionsError.new("Invalid options") unless options.kind_of? Hash
  
        type = (options[:type] == "city") ? "city" : "country" 
        time_zone = (options[:time_zone] == true ) ? true : false

        params = {} 
        params[:key] = self.api_key
        params[:ip]  = ip
        params[:timezone] = time_zone
        params[:format] = "json"

        response = self.class.get("#{type}/", query: params)
        parse_response(response)
      end
    end
  end
end
