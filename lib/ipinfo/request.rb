module IpInfo
  class API
    module Request
      def query data, options = {}
        ip = data.sub(/^https?\:\/\//, '').sub(/^www./,'')  

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
