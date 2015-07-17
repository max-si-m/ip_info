require "json"

module IpInfo
  class API
    module Parser
      class InvalidParamsError < ArgumentError; end

      def parse_response(response)        
        result = convert_keys response
        raise InvalidParamsError.new(result[:status_message]) if result[:status_code] == "ERROR"
        result
      end

      private
        def convert_keys(response)
          raise InvalidParamsError.new("Params must be presence") if response.nil?
          response.inject({}) {|hsh, (key,value)| hsh[key.to_s.gsub(/[A-Z]/){|s| '_' + s.downcase}.gsub(/^_/, '').to_sym] = value; hsh}
        end
    end
  end
end
