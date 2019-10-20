require 'pry-nav'
require 'wiz_app/nba_dot_com_player_row'
class WizApp::CLI

  
  def call
    #welcome
    puts "\nWelcome To The Washington Wizards App\n"
    @players = get_players
    binding.pry
    user_player
    get_user_player
    exit
  end

  

  def get_players
    # To be scrape
    WizApp::Scraper.new.player_rows.map do |row|
      WizApp::NbaDotComPlayerRow.new(row)
    end
    #binding.pry
  end

  def user_player
    #list players
    puts "Choose a number to pick a Wizards player you would like to see."
    min_num = 1
    max_num = @players.length
    #binding.pry
    @players.each_with_index do  |wizards, index| 
      puts "#{index+1}. #{wizards.name}"
    end
  end

  def get_user_player
    chosen_player = gets.strip.to_i
    show_players_for(chosen_player) if valid_input(chosen_player, @players)
  end

  #def menu
    #puts "Enter"
  #end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

def show_players_for(chosen_player)
  wizard = @players[chosen_player - 1]
  puts "Here is #{wizard.name} stats of the Washington Wizards"
  #puts "They played in #{wizard.games}"
  puts "G:#{wizard.games} PTS:#{wizard.pts} FG:#{wizard.fg} FG_Percent:#{wizard.fg_percent}  3PT:#{wizard.threepts} FT:#{wizard.ft} Oreb:#{wizard.oreb}
  Dreb:#{wizard.dreb} Reb:#{wizard.reb} Ast:#{wizard.ast} Stl:#{wizard.stl} TO:#{wizard.turnovers} PF:#{wizard.pf}"
end

def exit
  puts "Thanks for using the Wizard App"
  !exit
end

end



#puts "Which team would you like to know more about? (Enter: 1-25 or exit)"
	#	input = gets.strip.downcase
			
#		if input.to_i > 0
#			team_menu(input)
#		elsif input == "exit"
#			goodbye	
#		else
#			puts "Try again!"
#		end
#	end