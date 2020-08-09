class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
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

  def buy_cat(cat_instance)
    Cat.new(cat_instance, self)
  end

  def buy_dog(dog_instance)
    Dog.new(dog_instance, self)
  end

  def walk_dogs
    self.dogs.map do |dog_instance|
      dog_instance.mood = "happy"
    end
  end

  def feed_cats
  self.cats.map do |cat_instance|
    cat_instance.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |dog_instance|
      dog_instance.mood = "nervous"
      dog_instance.owner = nil
    end
    self.cats.map do |cat_instance|
      cat_instance.mood = "nervous"
      cat_instance.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end