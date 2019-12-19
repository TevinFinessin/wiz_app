require "wiz_app/players"
require 'pry'
#require 'nokogiri'
#require 'open-uri'
class WizApp::Scraper

  
  
  def self.scrape
    doc = Nokogiri::HTML(open("https://www.nba.com/wizards/stats/points"))
    doc.css("table.stats-table.player-stats.season-averages tbody tr").each do |row|
      #player = doc.css("div.player-name__inner-wrapper")
      name = row.css("span.playerName").text
      position = row.css("span.playerPosition").text
      jersey_num = row.css("span.playerNumber").text
      points = row.css("td.pts").text
      games = row.css("td.gp").text.to_i
      url = row.css("a").attr("href").value
      #binding.pry if !$debug
      WizApp::Players.new(name, position,jersey_num, points, games, url)
  # end
  #end
      
    end
  end
end
