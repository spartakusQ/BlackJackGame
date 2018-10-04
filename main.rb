require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'gambler'
require_relative 'game'

class Main 


  def initialize
    @game = Game.new
  end

  def run_game
    puts 'Для начала игры введите своё имя: '
    @@name = gets.chomp.capitalize
    puts "#{@@name} сегодня хороший вечер чтобы заработать несколько монет."
    @game.start_round
  end

  def menu_input
    puts %(Смотрите карты и решайте:
    1- Взять одну карту
    2- Пропустить ход
    3- Открываем карты)
    menu_input = gets.to_i
  end

  def see_table_human    
    puts "У вас на руках карты #{@game.player_hand.each {|x| puts x }}"
  end

  def self.see_table_dealer
    puts 'У диллера на руках'
  end
  
end
