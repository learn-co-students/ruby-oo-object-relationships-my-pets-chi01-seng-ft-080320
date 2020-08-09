class Dog
  attr_accessor :mood, :owner
  attr_reader :name 

  @@all = []

  def self.all 
    @@all
  end 

  def initialize(name,owner)
    @name = name 
    @mood = "nervous"
    @owner = owner 
    
    @@all << self 
  end 
end