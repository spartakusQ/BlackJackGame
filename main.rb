require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'gambler'
require_relative 'player'
require_relative 'source'
# class to manage the game
class MainInterface < Source
  attr_accessor :cards, :deck, :hand, :player, :coin

  def initialize
    @deck = Deck.new
    puts 'Для начала игры введите своё имя: '
    @name = gets.chomp.capitalize
    puts "#{@name} сегодня хороший вечер чтобы заработать несколько монет."
    @human = Gambler.new(@name)
    @dealer = Dealer.new('Dealer')
    start_game
  end
end
