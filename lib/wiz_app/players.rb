class WizApp::Players
  attr_accessor :name, :position, :jersey_num, :points, :games, :url 

  @@all = []

  def initialize(name, position, jersey_num, points, games, url)
    @name = name
    @position = position
    @jersey_num = jersey_num
    @points = points
    @games = games 
    @url = url
    @@all << self 
  end

  def self.all
    @@all
  end

  

end

  