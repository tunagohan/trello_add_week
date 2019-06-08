require './lib/request'
require 'date'

class TrelloAddWeekdayToSpecifiedLane
  class << self
    def post
      # validation check
      missing_env_list = validate_check
      unless missing_env_list.size.zero?
        puts "Missing Environments : #{missing_env_list.join(',')}"
        puts "Please execute again after setting."
        return exit!
      end

      # execute
      self.new.post
    end

    def validate_check
      missing_env = []
      missing_env.push('KEY') if ENV['KEY'].nil?
      missing_env.push('TOKEN') if ENV['TOKEN'].nil?
      missing_env.push('LANE_ID') if ENV['LANE_ID'].nil?
      return missing_env
    end
  end

  attr_reader :end_point, :target, :key, :token, :lane_id, :client

  def initialize
    @end_point = 'https://trello.com/1'
    @target = 'cards'
    @key = ENV['KEY']
    @token = ENV['TOKEN']
    @lane_id = ENV['LANE_ID']
    @client = Request.build
  end

  def post
    weekday = create_weekday
    weekday.each do |day|
      url = "#{end_point}/#{target}?key=#{key}&token=#{token}&idList=#{lane_id}&name=#{day}"
      client.post(url: url)
      puts "posted: #{day}"
    end
  end

  def create_weekday
    current_day = Date.today
    weekday = []
    1.upto(5).each do |num|
      day = current_day - (current_day.wday - num.to_i)
      parse_day_of_the_week = %w(日 月 火 水 木 金 土).at(day.wday)
      parse_day = day.strftime("%m月%d日 (#{parse_day_of_the_week})")
      weekday.push(parse_day)
    end
    return weekday
  end
end

TrelloAddWeekdayToSpecifiedLane.post
