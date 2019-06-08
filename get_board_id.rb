require './lib/board_id'
body = BoardId.get
body.each{|b| puts b}