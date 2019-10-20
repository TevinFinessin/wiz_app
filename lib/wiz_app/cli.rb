require 'pry-nav'
require 'wiz_app/nba_dot_com_player_row'
class WizApp::CLI

  
  def call
    #welcome
    
    puts
    @players = get_players
    #binding.pry
    user_player
    get_user_player
    #end_program?#exit
  end

  

  def get_players
    # To be scrape
    WizApp::Scraper.new.player_rows.map do |row|
      WizApp::NbaDotComPlayerRow.new(row)
    end
    #binding.pry
  end

  def user_player
    #menu
    #list players
    puts "\nWelcome To The Washington Wizards App\n"
    puts
    puts "Choose a number to pick a Wizards player you would like to see."
    puts
    #binding.pry
    @players.each_with_index do  |wizards, index| 
      puts "#{index+1}. #{wizards.name}"
    end
    puts 
    puts "Enter X to exit"
   # input = gets.strip
end


  def get_user_player
    #menu
    #min_num = 1
    #max_num = @players.length
    input = gets.strip

    if input == "X" || input == "x"
      end_program
    end

    chosen_player = input.to_i
    show_players_for(chosen_player) if valid_input(chosen_player, @players)
      if !valid_input(chosen_player, @players)
        puts "#{input} is invalid please enter a valid number between 
        1 and  #{@players.length}" 
        get_user_player
      end
  end

  #def menu
    #puts "Enter"
  #end

  def valid_input(input, data) #should return true or false

     input.to_i > 0 && input.to_i <= data.length
  end

def show_players_for(chosen_player)
  wizard = @players[chosen_player - 1]
  puts "Here is #{wizard.name} stats of the Washington Wizards"
  #puts "They played in #{wizard.games}"
  puts "G:#{wizard.games} PTS:#{wizard.pts} FG:#{wizard.fg} FG_Percent:#{wizard.fg_percent}  3PT:#{wizard.threepts} FT:#{wizard.ft} Oreb:#{wizard.oreb}
  Dreb:#{wizard.dreb} Reb:#{wizard.reb} Ast:#{wizard.ast} Stl:#{wizard.stl} TO:#{wizard.turnovers} PF:#{wizard.pf}"
  return_menu
end

def return_menu
  puts "Enter wiz to see other player stats or enter X to end"
  input = gets.strip
  if input == "x" || input == "X"
    end_program
  elsif input == "wiz"
    user_player
  else
      puts "#{input} is invalid"
      return_menu
    end

  end

def end_program
  puts "Thanks for using the Wizard App"
  !exit
end

end
