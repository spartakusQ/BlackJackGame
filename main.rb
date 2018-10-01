require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'player'

# class to manage the game
class MainInterface
  attr_accessor :cards, :deck, :hand, :player, :coin

  def initialize
    @deck = Deck.new
    puts 'Для начала игры введите своё имя: '
    @name = gets.chomp.capitalize
    puts "#{@name} сегодня хороший вечер чтобы заработать несколько монет."
    @human = Player.new(@name)
    @dealer = Dealer.new('Dealer')
    start_game
  end

  def start_game
    2.times { add_card(@human) }
    2.times { add_card(@dealer) }
    @human.rate
    @dealer.rate
    puts "#{@name} у вас на руках карты #{@human.hand[0].par} #{@human.hand[0].shirt} #{@human.hand[1].par}#{@human.hand[1].shirt} у вас осталось #{@human.coin}$ сумма карт #{card_amount(@human)} "
    puts "#{see_dealer} и осталось #{@dealer.coin}$"
    menu
  end

  def card_amount(player)
    player.scorer_values
  end

  def add_card(player)
    player.deal
  end

  def see_card
    @human.show_card
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
    when 1 then human_give
    when 2 then dealer_give
    when 3 then show_card_human
    when 0 then exit
    end
  end

  def show_card_human
    puts "#{@name} у вас на руках карты #{@human.hand[0].par} #{@human.hand[0].shirt} #{@human.hand[1].par}
    #{@human.hand[1].shirt} сумма #{card_amount(@human)}"
    puts "У диллера на руках карты #{@dealer.hand[0].par} #{@dealer.hand[0].shirt} #{@human.hand[1].par}
    #{@dealer.hand[1].shirt} сумма #{card_amount(@dealer)}"
    if card_amount(@dealer) > card_amount(@human) && card_amount(@dealer) < 21
      @dealer.double_win
      puts "Ты проиграл, Выйграл диллер. У диллера #{@dealer.coin}$, у тебя #{@human.coin}$"
      new_game
    elsif card_amount(@human) > card_amount(@dealer) && card_amount(@human) < 21
      puts "Ты выиграл, у диллера #{card_amount(@dealer)}очков"
      @human.double_win
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
    puts "Вы взяли карту #{@human.hand[2].par}#{@human.hand[2].shirt}, сумма карт стала #{card_amount(@human)} "
    dealer_give
    if card_amount(@human) <= 21 && card_amount(@human) > card_amount(@dealer)
      puts "У диллера #{card_amount(@dealer)} очков"
      @human.double_win
      puts "Ты победил.Сумма твоих карт #{card_amount(@human)} У тебя #{@human.coin}$"
    end
    new_game
  end

  def dealer_give
    while card_amount(@dealer) <= 17
      add_card(@dealer)
      puts "Дилер взял карту #{@dealer.hand[2].par}#{@dealer.hand[2].shirt} "
      puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt} #{@dealer.hand[2].par}#{@dealer.hand[2].shirt}сумма карт #{card_amount(@dealer)}"
      if card_amount(@dealer) > card_amount(@human) && card_amount(@dealer) < 21
        @dealer.double_win
        puts "Ты проиграл, Выйграл диллер. У диллера #{@dealer.coin}$, у тебя #{@human.coin}$"
        new_game
      elsif @human.double_win
           puts "Ты выиграл, у диллера #{card_amount(@dealer)}очков"
           new_game
      end
      if card_amount(@dealer) == 21
        puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt}"
        @dealer.double_win
        puts "Диллер выйграл сумма карт #{card_amount(@dealer)} У диллера #{@dealer.coin}$ у тебя #{@human.coin}$"
        new_game
      elsif card_amount(@dealer) > 21
        puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt}"
        @human.double_win
        puts "У диллера больше 21, ты победил. У тебя #{@human.coin}$"
        new_game
      end
    end
  end

  def new_game
    puts %(Может ещё одна партию?
      1- Сыграть ещё одну партию.
      2- Уйти домой в штанах.)
    input = gets.to_i
    case input
    when 1 then
      until @human.zero? && @dealer.zero?
        @human.reset_cards
        @dealer.reset_cards
        start_game
        if @human.zero?
          exit puts 'Радуйтесь что с вами ваша гордость и штаны.'
        elsif @dealer.zero?
          exit puts 'Банк диллера пуст.'
        end
      end
    when 2 then
      puts 'Спасибо за игру'
      exit
    end
  end
end
