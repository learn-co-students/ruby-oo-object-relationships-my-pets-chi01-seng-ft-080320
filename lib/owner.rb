class Owner
  
  #sets up name and species you cannot change
  attr_reader :name, :species 
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    Owner.all << self 
  end

  #Can say its species
  def say_species
    p "I am a #{@species}."
  end
  #allows access to all instances
  def self.all 
    @@all 
  end
  #counts all instances
  def self.count
    self.all.count 
  end 
  #clears all instances
  def self.reset_all
    self.all.clear
  end 
  #return all cats associated with owner
  def cats 
    Cat.all.select do |cat_instance|
      cat_instance.owner == self 
    end
  end
  #return all dogs associated with owner
  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self 
    end
  end

  #can buy instance of Cat class

  def buy_cat(cat)
    new_cat = Cat.all.find do |cat_instance|
      cat_instance.name == cat 
    end
    if new_cat 
    Cat.new(new_cat.name, self)
    else 
      brand_new_cat = Cat.new(cat, self)
    end 
  end
  #can buy instance of Dog class
  def buy_dog(dog)
    new_dog = Dog.all.find do |dog_instance|
      dog_instance.name == dog 
    end
    if new_dog 
    Dog.new(new_dog.name, self)
    else 
      brand_new_dog = Dog.new(dog, self)
    end 
  end
  #makes dogs happy
  def walk_dogs
    self.dogs.map do |owners_dog|
      owners_dog.mood = "happy"
    end
  end
  #makes cats happy
  def feed_cats
    self.cats.map do |owners_cat|
      owners_cat.mood = "happy"
    end
  end
  #this is very sad and makes pets nervous
  def sell_pets
    all_pets = []
    all_pets << self.cats 
    all_pets << self.dogs 
    all_pets.flatten.map do |each_pet|
      each_pet.mood = "nervous"
      each_pet.owner = nil
    end
  end
  #lists pets
  def list_pets 
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end #of Owner class