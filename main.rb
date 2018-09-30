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
    2.times { add_card(@human) }
    2.times { add_card(@dealer) }
    @human.rate
    @dealer.rate
    puts "#{@name} у вас на руках карты #{@human.hand[0].card} #{@human.hand[0].shirt} #{@human.hand[1].card}#{@human.hand[1].shirt} у вас осталось#{@human.coin}$ сумма карт #{card_amount(@human)} "
    puts "#{see_dealer} и осталось #{@dealer.coin}$"
    menu
  end
    
  end
  
end
