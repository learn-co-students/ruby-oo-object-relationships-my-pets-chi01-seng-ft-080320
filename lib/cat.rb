class Cat

    attr_reader :name
    attr_accessor :owner, :mood

    @@all = []

  # code goes here
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    
    @@all << self
  end

  def self.all
    @@all
  end

end