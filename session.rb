class Session
  @@all = []
  attr_accessor :player, :coach, :time

  def initialize (player, coach, time, skill_practiced="all")
    @player = player
    @coach = coach
    @time = time
    @skill_practiced = skill_practiced
    @@all << self
  end

  def self.all
    @@all
  end

end
