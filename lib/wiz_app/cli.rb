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
    @players = ["John Wall", "Bradley Beal", "Jeff Green", "Thomas Byrant"]
  end

  def user_player
    #list players
    puts "Choose a Wizards player you would like to see"
    @players.each_with_index do  |player, index| 
      puts "#{index}. #{player}"
    end
  end

  def get_user_player
    chosen_player = gets.strip
    binding.pry
   # valid_input(chosen_player.to_i, @players)
  #end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end
















end