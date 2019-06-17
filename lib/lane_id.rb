require './lib/request'

#
# LaneId Class
#
# description:
#   Get the lane ID of Trello in which you are participating.
#
# example:
#   require './lib/lane_id'
#   board_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#   LaneId.get(board_id: board_id)
#

class LaneId
  class << self
    def get(board_id:)
      # validation check
      missing_env_list = validate_check
      unless missing_env_list.size.zero?
        puts "Missing Environments : #{missing_env_list.join(',')}"
        puts "Please execute again after setting."
        exit!
      end

      # execute
      self.new(board_id: board_id).get
    end

    def validate_check
      missing_env = []
      missing_env.push('KEY') if ENV['KEY'].nil?
      missing_env.push('TOKEN') if ENV['TOKEN'].nil?

      missing_env
    end
  end

  attr_reader :end_point, :target, :key, :token, :board_id, :client

  def initialize(board_id:)
    @end_point = 'https://trello.com/1'
    @target    = 'boards'
    @key       = ENV['KEY']
    @token     = ENV['TOKEN']
    @board_id  = board_id
    @client    = Request.build
  end

  def get
    url      = "#{end_point}/#{target}/#{board_id}/lists?key=#{key}&token=#{token}&fields=name"
    response = client.get(url: url)
    parse_body(body: response.body)
  end

  def parse_body(body:)
    JSON.parse(body)
  end
end