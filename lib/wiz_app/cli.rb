class WizApp::CLI

  def call
    #welcome
    puts "\nWelcome To The Washington Wizards App\n"
    get_player
    user_player
    get_user_player
  end

  

  def get_player
    # To be scrape
    @players = WizApp::players.all
  end

  def user_player
    #list players
    puts "Choose a Wizards player you would like to see."
    @players.each_with_index do  |wizards, index| 
      puts "#{index}. #{wizards}"
    end
  end

  def get_user_player
    chosen_player = gets.strip.to_i
    show_players_for(chosen_player) if valid_input(chosen_player, @players)
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

def show_players_for(chosen_player)
  wizards = @players[chosen_player - 1]
  puts "Here is #{wizards} of the Washington Wizards "
  # WizApp::CLI all.each_with_index each do | team |
   # puts team.name
  # end
  # get_user_player
end














end