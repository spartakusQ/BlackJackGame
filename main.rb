require_relative 'card'
require_relative 'dealer'
require_relative 'human'
require_relative 'player'
require_relative 'deck'

# class to manage the game
class MainInterface
  attr_accessor :cards, :deck, :hand, :user, :coin

  def initialize
    @deck = Deck.new
    puts 'Для начала игры введите своё имя: '
    @name = gets.chomp.capitalize
    puts "#{@name} сегодня хороший вечер чтобы заработать несколько монет. "
    @player = Human.new(@name)
    @dealer = Dealer.new(@name)
    start_game
    
  end

  def start_game
    
  end
  
end
