require 'pry'
class Manager
	attr_accessor :name, :salary, :team, :assets

	@@all = []

	def initialize(name, salary, team, assets = 1000000)
		@name = name
		@salary = salary
		@team = team
		@assets = assets
		@@all << self
	end

	def create_session(player, coach, time, skill_practiced="all")
	 	Session.new(player, coach, time, skill_practiced)
	 end


	def kick_player(player)
		Session.all.each do |session|
			if session.player == player
				player.destroy
				puts "YOU'RE FIRED!"
			end
		end
	end


	def high_life(bonus)
		@salary += bonus
		@assets = @assets*2
	end
	

	def self.all
		@@all 
	end


	def self.highest_salary
		x = all.max_by {|manager| manager.salary}
		puts x
	end

end


#testcode
# temp1 = Manager.new("Hodor", 100000, "HODOR")
# temp2 = Manager.new("Hodor2", 100000000, "HODOR")
# temp3 = Manager.new("Hodor3", 100000000000, "HODOR")
# Manager.all
# Manager.highest_salary