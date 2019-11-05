require './lib/request'

#
# BoardID Class
#
# description:
#   Get the boat ID of Trello in which you are participating.
#
# example:
#   require './lib/board_id'
#   BoardID.get
#

class BoardId
  class << self
    def get
      # validation check
      missing_env_list = validate_check
      unless missing_env_list.size.zero?
        puts "Missing Environments : #{missing_env_list.join(',')}"
        puts "Please execute again after setting."
        exit!
      end

      # execute
      self.new.get
    end

    def validate_check
      missing_env = []
      missing_env.push('KEY') if ENV['KEY'].nil?
      missing_env.push('TOKEN') if ENV['TOKEN'].nil?
      missing_env.push('TRELLONAME') if ENV['TRELLONAME'].nil?

      missing_env
    end
  end

  attr_reader :end_point, :target, :key, :token, :trelloname, :client

  def initialize
    @end_point = 'https://trello.com/1'
    @target    = 'members'
    @key       = ENV['KEY']
    @token     = ENV['TOKEN']
    @trelloname  = ENV['TRELLONAME']
    @client    = Request.build
  end

  def get
    url         = "#{end_point}/#{target}/#{trelloname}/boards?key=#{key}&token=#{token}&fields=name"
    response    = client.get(url: url)

    parse_body(body: response.body)
  end

  def parse_body(body:)
    JSON.parse(body)
  end
end
