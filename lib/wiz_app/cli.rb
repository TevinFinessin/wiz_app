require 'pry'

class WizApp::CLI

  def call
    puts "\nWelcome To The Washington Wizards App\n"
    puts
    WizApp::Scraper.scrape
    puts "Choose a number to pick a Wizards player you would like to see."
    puts
    get_players
    loop do
      menu
    end
  end

  

  def get_players
    #WizApp::Scraper.scrape
    @players = WizApp::Players.all.each {|wiz| wiz.name}
    @players.each_with_index { |wizards, index| puts "#{index + 1}. #{wizards.name}"}
    #binding.pry
  end

  def menu
    puts
    print "Enter a number here or X to exit: "
    #puts "Enter X to exit"
    input = gets.strip

    if input == "X" || input == "x"
      puts
      puts "Thank you for using this Wizard App"
      puts
      exit
    end
    
    puts
    chosen_player = input.to_i
    show_players_for(chosen_player) if valid_input(chosen_player, @players)
    if !valid_input(chosen_player, @players)
      puts "#{input} is invalid please enter a valid number between 
      1 and  #{@players.length}" 
      get_players
    end
  end

  def valid_input(input, data)
    input.to_i > 0 && input.to_i <= data.length
  end

  def show_players_for(chosen_player)
    wizard = @players[chosen_player - 1]
    puts Rainbow("Here is #{wizard.name} stats of the Washington Wizards").blue
    puts Rainbow("Their position is a #{wizard.position}").blue
    puts Rainbow("Their jersey number is #{wizard.jersey_num}").blue
    puts Rainbow("They played a total of #{wizard.games} games").blue
    puts "They scored a total of #{wizard.points}.ppg"
    puts "For more stats here is the players link #{wizard.url}"
    puts
  end

 

  
end
