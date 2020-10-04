require 'http'

module GetAccept
  class Api
    attr_reader :client

    def self.get_token(options = {})
      payload = {
                  email: options[:email],
                  password: options[:password],
                  client: options[:client],
                  entity_id: options[:entity_id],
                }
      HTTP.post("#{API_BASE}/auth", json: payload)
    end


    def initialize(options = {})
      @token = options[:token]
      @client = HTTP.auth("Bearer #{@token}").headers('Content-Type' => 'application/json')
    end

    def refresh_token
      client.get("#{API_BASE}/refresh",)
    end

    def revoke_token
      client.get("#{API_BASE}/revoke")
    end

    def open_url url
      url = URI.encode("https://app.getaccept.com/auth/sso/login?token=#{@token}&go=#{url}")
    end

    def method_missing(method, *args)
      klass = method.to_s.split('_').collect(&:capitalize).join
      Object.const_get("GetAccept::#{klass}").new(@client)
    rescue NameError
      super
    end

    def respond_to_missing?(method, include_private = false)
      klass = method.to_s.capitalize
      Object.const_get("GetAccept::#{klass}")
      true
    rescue NameError
      super
    end
  end
end
