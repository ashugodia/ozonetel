module Ozonetel
  class << self
    attr_accessor :outbound_version, :api_key
    
    def configure
      yield self
    end
  end  
  
  class AuthenticationError < StandardError;  end

  class UnexpectedError < StandardError;  end

  class ParamsError < StandardError;  end
end
