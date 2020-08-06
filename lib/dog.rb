class Dog
  
  #initialize with changeable owner and mood and static name
  attr_reader :name 
  attr_accessor :owner, :mood
  @@all = []

  def initialize(name, owner)
    @name = name 
    @owner = owner
    @mood = "nervous"

    Dog.all << self 
  end 

  #allow access to all instances of Dog class
  def self.all 
    @@all 
  end 

end #of Dog class
