module GetAccept
  class Resource
    attr_reader :client

    def initialize client
      @client = client
    end

    protected
    def get(path)
      response = client.get("#{API_BASE}#{path}")
      handle_response(response)
    end

    def post(path, data = nil)
      response = client.post("#{API_BASE}#{path}", json: data)
      handle_response(response)
    end

    def delete (path)
      client.delete("#{API_BASE}#{path}")
    end

    def handle_response(response)
      parsed_response = response.parse
      if response.code < 400
        parsed_response
      else
        error_klass = response.code >= 500 ? ServerError : RequestError
        raise error_klass.new({
            response_code: response.code,
            response_body: parsed_response,
            type: parsed_response['error'],
            message: parsed_response['description'],
            errors: parsed_response['errors'],
        })
      end
    end
  end
end
