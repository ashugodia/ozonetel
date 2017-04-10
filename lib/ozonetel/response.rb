module Ozonetel
  class Response
    
    def initialize(response)
      set_response_data(response.parsed_response)
    end
    
    def set_response_data(response)
      (response['response']).each do |key, value|
        set_variable(key, value)
      end
    end
    
    def set_variable(key, value)
      self.class.send(:attr_accessor, key) #Set accessors dynamically
      instance_variable_set("@#{key}", value)
    end
  end
end

