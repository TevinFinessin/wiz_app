require 'nokogiri'
require 'open-uri'
#require 'pry'

@doc = Nokogiri::HTML(open('https://www.nba.com/wizards/roster'))
@doc.css(".wrapper").each do |a|
  player = playernew
  player.name = a.css(".roster__playestatssr__header__heading")
  player.position = a.css(".roster__player__header_position")
  player.number = a.css(".roster__player__header_jnumber")
 player_url = @doc.css("footer.roster__player__footer [href]").attr("href").value
  info = @doc.css(".roster__player")
  info.each do |p|
  player_bio = p.xpath("//div/@aria-label")
   end
   @doc2 = Nokogiri::HTML(open('player_url'))
       stats = @doc2.css(".player-stats__stat-value")
       binding.pry
  end
#binding.pry

# => "27.3"
# [11] pry(main)> stats[2].text
# => "5.3"
# [12] pry(main)> stats[3].text
# => "5.3"
# [13] pry(main)> stats[4].text
# => "5.2"
# [14] pry(main)> stats[5].text
# => "5.2"
# [15] pry(main)> stats[6].text
# => "15.2"
# [16] pry(main)> stats[7].text
# => "6-3"
# [17] pry(main)> stats[8].text
# => "6-3"
# [18] pry(main)> stats[9].text
# => "190 lbs"
# [19] pry(main)> stats[10].text
# => "190 lbs"
# [20] pry(main)> stats[11].text
# => "31"
# [21] pry(main)> stats[12].text
# => "31"
# [22] pry(main)> stats[13].text
# => "03/14/1988"
# [23] pry(main)> stats[14].text
# => "Davidson/USA"
# [24] pry(main)> stats[15].text
# => "2009 Rnd 1 Pick 7"
# [25] pry(main)> stats[16].text
# => "2009"
# [26] pry(main)> stats[17].text
# => "10 yrs"
# [27] pry(main)> stats[18].text