class Dog
  attr_reader :name
  attr_accessor :mood, :owner

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.class.all << self
    @owner.dogs << self
  end

  def self.all
    @@all
  end
end
