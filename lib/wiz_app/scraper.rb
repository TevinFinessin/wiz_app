require 'nokogiri'
require 'open-uri'
class WizApp::Scraper

  #def scrape_players  
    #stats = ["22.3ppg", "11.2ppg", ""]
    #player_names.map do |name|
     # r = WizApp::Players.new(name)
      #r.name = name
     # r.stats = stats

     # r
   # end
  #end
  
  def player_names
    player_name_cells = stat_page.css("td.player_name span.playerName a")
    
    player_name_cells.map { |cell| cell.children.first.text }
  end

  def stat_page
    @stat_page ||= Nokogiri::HTML(open("https://www.nba.com/wizards/stats?season=2019-20&season_type=preseason"))
  end
  
  def player_rows
    stat_page.css("table.stats-table.player-stats.season-averages tbody tr")
  end

  def player_stats
    doc = Nokogiri::HTML(open("https://www.nba.com/wizards/stats?season=2019-20&season_type=preseason"))
    player_stats_num = doc.css("")

    player_stats_num
  end
    #stat_nba
    #binding.pry
    #page = Nokogiri::HTML(open(site))
#puts page #|| 'Nope'
#players = page.css('table td a').text.strip

#players.each do |p|
#puts w.text
#end

end