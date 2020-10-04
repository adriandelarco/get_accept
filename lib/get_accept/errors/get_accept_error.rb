module GetAccept
  class GetAcceptError < StandardError
    attr_accessor :response_code, :response_body, :message, :type, :errors

    def initialize(data = {message: nil, type: nil, response_code: nil, reponse_body: nil, errors: nil})
      @response_code = data[:response_code]
      @response_body = data[:response_body]
      @message = data[:message]
      @type = data[:type]
      @errors = data[:errors]

      super(message)
    end
  end
end
