require '../lib/lane_id'
require '../lib/board_id'

body = BoardId.get
body.each{|b| puts b}

puts "------------------------------"
puts "対象のボードのIDを入力してください。"
puts "対象ボードIDは上記で表示されているIDのいずれかをコピペし入力してください。"

p "board_id: "
board_id = gets.chomp!

puts "Success."

puts "------------------------------"

body = LaneId.get(board_id: board_id)
body.each{|b| puts b}

puts "※ レーンIDを direnv などで環境変数として登録してください。"

puts "Finish."

