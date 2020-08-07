require "pry"

class Owner
  attr_reader :name, :species
  attr_accessor :cats

  @@all = []

  def initialize (name)
    @name = name
    @species = 'human'
    self.class.all << self
  end

  def say_species 
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count 
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |individual_cat|
      individual_cat.owner == self
    end
  end 

  def dogs
    Dog.all.select do |individual_dog|
      individual_dog.owner == self
    end
  end

  def buy_cat(cat_instance)
    cat = Cat.new(cat_instance, self)
  end

  def buy_dog(dog_instance)
    dog = Dog.new(dog_instance, self)
  end

  def walk_dogs
    self.dogs.each do |individual_dog|
      individual_dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |individual_cat|
      individual_cat.mood = "happy"
    end
  end

  def sell_pets
    dogs = self.dogs
    cats = self.cats
    self.dogs.each do |individual_dog|
      individual_dog.mood = "nervous"
      individual_dog.owner = nil
    end
    self.cats.each do |individual_cat|
      individual_cat.mood = "nervous"
      individual_cat.owner = nil
    end

  end 

  def list_pets
    dogs = self.dogs
    cats = self.cats
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."

  end

end