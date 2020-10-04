require 'get_accept/version'

require 'get_accept/api'
require 'get_accept/resource'
require 'get_accept/resources/user'
require 'get_accept/resources/document'
require 'get_accept/resources/file'
require 'get_accept/resources/template'
require 'get_accept/resources/subscription'
require 'get_accept/errors/get_accept_error'
require 'get_accept/errors/request_error'
require 'get_accept/errors/server_error'

module GetAccept
  API_BASE = 'https://api.getaccept.com/v1'
end
