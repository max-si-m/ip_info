require "json"

module Ipinfodb
  class API
    module Parser
      def parse_response(response)
        response.parsed_response
      end
    end
  end
end
