require 'pry'

class Owner
  attr_reader :name, :species, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def buy_cat(name)
    Cat.new(name, self)
    #putting the cat into owner's cats array happens in the Cat class
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.clear
    self.dogs.clear
  end

  #challenge: try to come back to this and write a method that sells each pet by name

  def sell_pet_by_name(pet_name)
    #pet_name is a string, need to find which pet instance has this name
    #iterate over both arrays

    dogs.find {|d| d.name == pet_name} || cats.find {|c| c.name == pet_name}

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
