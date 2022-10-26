class TokenService
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def retrieve_token
      Omise::Token.retrieve(token) rescue nil
    end
end