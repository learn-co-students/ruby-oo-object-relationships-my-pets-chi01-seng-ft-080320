class Cat
  
  #initialize cat with changeable mood and owner and static name
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []
  def initialize(name, owner)
    @name = name 
    @owner = owner 
    @mood = "nervous"

    Cat.all << self 
  end 
  #allows access to all Cat instances
  def self.all 
    @@all
  end

end