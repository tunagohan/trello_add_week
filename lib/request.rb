require 'net/http'
require 'uri'
require 'json'

#
# Request Class
#
# description:
#   Send a request based on the URL.
#   This Request class can do get and post.
#
#   get:  The only value returned is the body.
#   post: HTTPS status etc. will not be returned.
#
# example:
#   - get
#       require 'lib/request'
#       url = 'https://xxx.xxx.xxx/'
#       request = Request.build
#       request.get(url: url)
#       puts response.body
#
#   - post
#       require 'lib/request'
#       url = 'https://www.xxx.xxx?xxx=xxx'
#       request = Request.build
#       request.post(url: url)
#

class Request
  class << self
    def build
      self.new
    end
  end

  def get(url:)
    uri = create_uri(url: url)
    return get_response(uri: uri)
  end

  def post(url:)
    uri = create_uri(url: url)
    return post_request(uri: uri)
  end

  private

  def create_uri(url:)
    encoded_uri = URI.encode(url)
    return URI.parse(encoded_uri)
  end

  def get_response(uri:)
    return Net::HTTP.get_response(uri)
  end

  def post_request(uri:)
    request = Net::HTTP::Post.new(uri)
    Net::HTTP.start(uri.hostname, uri.port, {use_ssl: uri.scheme == "https"}) do |http|
      http.request(request)
    end
  end
end