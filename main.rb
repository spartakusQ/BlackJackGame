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
    @human = Human.new(@name)
    @dealer = Dealer.new(@name)
    start_game
  end

  def start_game
    2.times { add_card(@human) }
    2.times { add_card(@dealer) }
    @human.rate
    @dealer.rate
    puts "#{@name} у вас на руках карты #{@human.hand[0].card} #{@human.hand[0].shirt} #{@human.hand[1].card}#{@human.hand[1].shirt} у вас осталось #{@human.coin}$ сумма карт #{card_amount(@human)} "
    puts "#{see_dealer} и осталось #{@dealer.coin}$"
    menu
  end

  def card_amount(human)
    human.count_values
  end

  def add_card(human)
   human.deal
  end

  def see_dealer
   "У диллера #{@dealer.show_dealer} карты"
  end

def menu
  puts %(Смотрите карты и решайте:
    1- Взять одну карту
    2- Пропустить ход
    3- Открываем карты)  
  input = gets.to_i
  case input
  def show_card_human
    puts "#{@name} у вас на руках карты #{@human.hand[0].card} #{@human.hand[0].shirt} #{@human.hand[1].card}
    #{@human.hand[1].shirt} сумма #{card_amount(@player)}"
    puts "У диллера на руках карты #{@dealer.hand[0].card} #{@dealer.hand[0].shirt} #{@player.hand[1].card}
    #{@dealer.hand[1].shirt} сумма #{card_amount(@dealer)}"
    if card_amount(@dealer) > card_amount(@player) && card_amount(@dealer) < 21
      @dealer.double_win
      puts "Ты проиграл, Выйграл диллер. У диллера #{@dealer.coin}$, у тебя #{@player.coin}$"
      new_game
    elsif card_amount(@player) > card_amount(@dealer) && card_amount(@player) < 21
      puts "Ты выиграл, у диллера #{card_amount(@dealer)}очков"
      @player.double_win
      new_game
    else
      @player.win
      @dealer.win
      puts 'Ничья. Деньги возвращены обратно'
      new_game
    end
  end

  def human_give
    add_card(@human)
    puts "Вы взяли карту #{@human.hand[2].card}#{@human.hand[2].shirt}, сумма карт стала #{card_amount(@human)} "
    dealer_give
    if card_amount(@human) <= 21 && card_amount(@human) > card_amount(@dealer)
      puts "У диллера #{card_amount(@dealer)} очков"
      @human.double_win
      puts "Ты победил.Сумма твоих карт #{card_amount(@human)} У тебя #{@human.coin}$"
    end
    new_game
  end
  when 1 then 
  when 2 then 
  when 3 then 
  when 0 then exit
  end
end
  
end
