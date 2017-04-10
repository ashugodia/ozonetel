require 'httparty'
module Ozonetel
  module Outbound
    class Call
      include HTTParty
      
      base_uri 'http://www.kookoo.in/outbound/outbound.php'
      
      def initialize; end
      
      def self.connect(params={})
        self.new.connect(params)
      end
      
      def connect(params={})
        params = params.merge(configuration)
        if valid?(params)
          response = self.class.get(URI.escape("?#{transform_params(params)}"))
          handle_response(response)
        end
      end
      
      protected
      
      def valid?(params)
        mandatory_keys = [:phone_no, :api_key]
        unless mandatory_keys.all?{|key| params.keys.include?(key)}
          raise Ozonetel::ParamsError, "#{key} parameter missing." 
        else
          return true
        end
      end
      
      def transform_params(params)
        transformed_params = []
        params.each do |k,v| transformed_params << "#{k}=#{v}" end
        transformed_params.join('&')
      end
      
      def configuration
        {:outbound_version => Ozonetel.outbound_version, :api_key => Ozonetel.api_key}
      end
      
      def handle_response(response)
        case response.code.to_i
        when 200...300 then Ozonetel::Response.new(response)
        when 401 then raise Ozonetel::AuthenticationError, response.body 
        when 403 then Ozonetel::Response.new(response)
        else
          raise Ozonetel::UnexpectedError, response.body
        end
      end
      
    end
  end
end
