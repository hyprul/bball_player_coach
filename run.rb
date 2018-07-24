require_relative './player.rb'
require_relative './coach.rb'
require_relative './session.rb'
require "pry"

# Player takes (name, jersey number)
tim = Player.new("Tim Duncan", 21)
kobe = Player.new("Kobe Bryant", 24)
lebron = Player.new("Lebron James", 23)
kevin = Player.new("Kevin Durant", 35)

#Coach takes (name, specialty)
pop = Coach.new("Gregg Popovich", "Team Work")
chip = Coach.new("Chip Engellend", "Shot Dr.")
pat = Coach.new("Pat Riley", "Hard D")
kerr = Coach.new("Steve Kerr", "Get Lucky")
phil = Coach.new("Phil Jackson", "Ring Chasing")

#Session takes (object of player, object of coach, time of session(in mins.), optionaly skill practiced or defaults to all )
tim_pop = Session.new(tim,pop,60)
kobe_pat = Session.new(kobe,pat,30)
lebron_chip = Session.new(lebron, chip, 60, "shot")
tim_pat= Session.new(tim,pat,60)
tim_kerr= Session.new(tim,kerr,60, "luck")
kobe_phil =Session.new(kobe,phil,60)

pop.create_session(tim, 60)               #creates a session for coach called from  & player passed in with skill practiced to "all" as default
pop.create_session(kevin, 60, "defense")  #creates a session for coach called from  & player passed in with skill practiced set to "defense"
kobe.create_session(pat, 30)              #creates a session for player called from & coach passed in with skill practiced to "all" as default
kobe.create_session(pat, 30, "scoring")   #creates a session for player called from & coach passed in with skill practiced to "scoring"

pop.players                               #returns all of the player objects pop has coached
pop.all_sessions                          #returns all of the sessions pop had
kobe.coaches                              #returns all coach objects kobe has had
kobe.all_sessions                         #returns all of the sessions kobe had


Player.all          #returns all player objects in existance
Coach.all           #returns all coach objects in existance



###############################Bonus##########################################
Player.hardest_working  #returns string of hardest_working Player (most time overall sessions)
Coach.hardest_working   #returns string of hardest_working Coah   (most time overall sessions)

# binding.pry
#
# false
