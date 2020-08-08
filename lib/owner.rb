class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(cat)
    cat = Cat.new(cat, self)
  end

  def buy_dog(dog)
    dog = Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
      self.dogs.map do |dog|
       dog.mood = "nervous"
       dog.owner = nil
    end
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

end