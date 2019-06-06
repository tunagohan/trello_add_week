require "date"
require 'net/http'
require 'uri'

END_POINT = 'https://trello.com/1'.freeze
TARGET_URL = 'cards'.freeze
KEY = ENV['KEY'].freeze
TOKEN = ENV['TOKEN'].freeze
LANE_ID = ENV['LANE_ID'].freeze

puts "start."
# 初期化
day = Date.today
# 今日の日付
day_1 = "#{day.strftime("%m月%d日")} (月)"
day_2 = "#{day.next_day(1).strftime("%m月%d日")} (火)"
day_3 = "#{day.next_day(2).strftime("%m月%d日")} (水)"
day_4 = "#{day.next_day(3).strftime("%m月%d日")} (木)"
day_5 = "#{day.next_day(4).strftime("%m月%d日")} (金)"
# forで回すために配列化
days = [day_5, day_4, day_3, day_2, day_1]
# ループ
for day in days do
  puts day

  url = URI.encode("#{END_POINT}/#{TARGET_URL}?key=#{KEY}&token=#{TOKEN}&idList=#{LANE_ID}&name=#{day}")
  uri = URI.parse(url)
  request = Net::HTTP::Post.new(uri)

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end
end

puts "done."
