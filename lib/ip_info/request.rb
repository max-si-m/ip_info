module IpInfo
  class API
    module Request
      REQUEST_TYPES = %w{city country}

      def query(data, options = {})
        ip = data.sub(/^https?\:\/\//, '').sub(/^www./,'')  

        type = options.fetch(:type, 'country')

        unless REQUEST_TYPES.include?(type)
          raise ArgumentError.new("Wrong request type (available: #{REQUEST_TYPES.join(",")})")
        end

        time_zone = options.fetch(:time_zone, false)

        params = {
          key:      api_key,
          ip:       ip,
          timezone: time_zone,
          format:   "json"
        }

        response = self.class.get("#{type}/", query: params)
        parse_response(response.parsed_response)
      end
    end
  end
end
