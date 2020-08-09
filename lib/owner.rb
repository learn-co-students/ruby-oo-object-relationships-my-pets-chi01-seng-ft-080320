class Owner
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    @say_species = "I am a human."
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
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |dog_instance|
      dog_instance.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat_instance|
      cat_instance.mood = "happy"
    end
  end

  def sell_pets
    # nervous_dogs = self.dogs
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    # nervous_cats = self.cats
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end