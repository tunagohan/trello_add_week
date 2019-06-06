require 'net/http'
require 'uri'
require 'json'

END_POINT = 'https://trello.com/1'.freeze
TARGET_URL = 'boards'.freeze
KEY = ENV['KEY'].freeze
TOKEN = ENV['TOKEN'].freeze
BOARD_ID = ENV['BOARD_ID'].freeze

url = URI.encode("#{END_POINT}/#{TARGET_URL}/#{BOARD_ID}/lists?key=#{KEY}&token=#{TOKEN}&fields=name")
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)

parse_body = JSON.parse(response.body)

parse_body.each {|body| puts body}
