class WizApp::Players

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    WizApp::Scraper.scrape_players
    @@all
  end

  def save
    @@all << self
  end



end