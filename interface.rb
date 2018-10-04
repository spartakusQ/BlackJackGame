require_relative 'game'

class Interface


  def initialize
    @game = Game.new
  end

  def run_game
    puts 'Для начала игры введите своё имя: '
    @@name = gets.chomp.capitalize
    puts "#{@@name} сегодня хороший вечер чтобы заработать несколько монет."
    @game.start_round
    menu
  end

  def menu
    puts %(Смотрите карты и решайте:
    1- Взять одну карту
    2- Пропустить ход
    3- Открываем карты)
    menu_input = gets.to_i
    case menu_input
    when 1 then @game.human_give
    when 2 then @game.dealer_give
    when 3 then @game.show_card_human
    when 0 then exit
    end
  end

  def menu_input

  end

  def see_table_human
    puts "У вас на руках карты #{@game.player_hand.each {|x| puts x }}"
  end

  def self.see_table_dealer
    puts 'У диллера на руках'
  end
  
end
