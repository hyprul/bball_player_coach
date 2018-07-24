class Coach
  @@all=[]
  attr_accessor :name, :specialty

  def initialize(name, specialty)
    @name = name
    @specialty = specialty
    @@all << self
  end

  def create_session(player, time, skill_practiced="all")
    Session.new(player, self, time, skill_practiced)
  end

  def all_sessions
    Session.all.select do |session|
      session.coach == self
    end
  end

  def players
  (all_sessions.map do |session|
      session.player
    end).uniq
  end

  def self.hardest_working
    hash ={}
    Session.all.each do |session|
      if !hash.has_key?(session.player.name)
        hash[session.coach.name] = session.time
      else
        stored_value = hash[session.coach.name]
        hash[session.coach.name] = (session.time + stored_value)
      end
    end
    (hash.max_by{|k,v| v}).first
  end

  def self.all
    @@all
  end

end
