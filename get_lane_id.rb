require './lib/lane_id'
body = LaneId.get
body.each{|b| puts b}