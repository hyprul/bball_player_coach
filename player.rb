class Player
  @@all=[]
  attr_accessor :name, :number

  def initialize(name, number)
    @name = name
    @number = number
    @@all << self
  end

  def create_session(coach, time, skill_practiced="all")
    Session.new(self, coach, time, skill_practiced)
  end

  def all_sessions
    Session.all.select do |session|
      session.player == self
    end
  end

  def coaches
    (all_sessions.map do |session|
      session.coach
    end).uniq
  end

  def self.who_is(number)
    @@all.find do |player|
      player.number == number
    end
  end

  def self.hardest_working
    hash ={}
    Session.all.each do |session|
      if !hash.has_key?(session.player.name)
        hash[session.player.name] = session.time
      else
        stored_value = hash[session.player.name]
        hash[session.player.name] = (session.time + stored_value)
      end
    end
    (hash.max_by{|k,v| v}).first
  end

  def self.all
    @@all
  end
end
