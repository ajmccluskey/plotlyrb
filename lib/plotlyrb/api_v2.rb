require 'net/https'
require 'base64'

module Plotlyrb
  class ApiV2

    PROTOCOL = 'https'
    HOSTNAME = 'api.plot.ly'
    BASE_PATH = 'v2'
    BASE_URI = "#{PROTOCOL}://#{HOSTNAME}/#{BASE_PATH}"
    IMAGES = URI.parse("#{BASE_URI}/images")
    COMMON_HEADERS = {
      'plotly-client-platform' => "Ruby #{Plotlyrb::VERSION}",
      'content-type' => 'application/json'
    }

    def self.plotly
      Plotly.new(COMMON_HEADERS)
    end

    def self.auth_plotly(username, api_key)
      encoded_auth = Base64.encode64("#{username}:#{api_key}")
      headers_hash = COMMON_HEADERS.merge({ 'authorization' => "Basic #{encoded_auth}" })
      Plotly.new(headers_hash)
    end
  end
end