class WizApp::Scraper

  def scrape_players
    player = []
    doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/WAS/2019.html"))
      binding.pry
  end

end