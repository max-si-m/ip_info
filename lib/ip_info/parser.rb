require "json"

module IpInfo
  class API
    module Parser
      class InvalidParamsError < ArgumentError; end

      def parse_response(response)
        convert_keys(response).tap do |result|
          raise InvalidParamsError.new(result[:status_message]) if result[:status_code] == "ERROR"
        end
      end

      private

      def convert_keys(response)
        raise InvalidParamsError.new("Params must be present") if response.nil?

        response.each_with_object({}) do |(key, value), hsh|
          hsh[to_snake_case(key)] = value
        end
      end

      def to_snake_case(key)
        key.to_s.gsub(/[A-Z]/) { |s| '_' + s.downcase }.gsub(/^_/, '').to_sym
      end
    end
  end
end
