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
    # @game.first_distribution
    see_table_human
    see_table_dealer
    
    menu
  end

  def see_table_human
    puts "У вас на руках карты #{@game.player_hand}, сумма ваших карт равна #{@game.human_scores}"
  end

  def see_table_dealer
    puts "У диллера на руках #{@game.see_dealer} карты"
  end

  def menu
    puts %(Смотрите карты и решайте:
    1- Взять одну карту
    2- Пропустить ход
    3- Открываем карты)
    menu_input = gets.to_i
    case menu_input
    when 1 then human_give
    when 2 then @game.dealer_give
    when 3 then @game.show_card_human
    when 0 then exit
    end
  end


  def human_give
    @game.human_add_card
    puts "Вы взяли карту #{@game.human_see_add_card} теперь у вас руках #{@game.player_hand+ ' '  + @game.human_see_add_card}: сумма карт равна  #{@game.human_scores}"
    if @game.human_scores > 21
       puts 'Вы проиграли'
      exit
    end

    menu
    # dealer_give
    # if card_amount(@human) <= 21 && card_amount(@human) > card_amount(@dealer)
    #   # puts "У диллера #{card_amount(@dealer)} очков"
    #   @human.double_win
    #   # puts "Ты победил.Сумма твоих карт #{card_amount(@human)} У тебя #{@human.coin}$"
    # end
    # new_game
  end







    def show_card_human
    # puts "#{@name} у вас на руках карты #{@human.hand[0].par} #{@human.hand[0].shirt} #{@human.hand[1].par}
    # #{@human.hand[1].shirt} сумма #{card_amount(@human)}"
    # puts "У диллера на руках карты #{@dealer.hand[0].par} #{@dealer.hand[0].shirt} #{@human.hand[1].par}
    # #{@dealer.hand[1].shirt} сумма #{card_amount(@dealer)}"
    if card_amount(@dealer) > card_amount(@human) && card_amount(@dealer) < 21
      @dealer.double_win
      # puts "Ты проиграл, Выйграл диллер. У диллера #{@dealer.coin}$, у тебя #{@human.coin}$"
      new_game
    elsif card_amount(@human) > card_amount(@dealer) && card_amount(@human) < 21
      # puts "Ты выиграл, у диллера #{card_amount(@dealer)}очков"
      @human.double_win
      new_game
    else
      @player.win
      @dealer.win
      # puts 'Ничья. Деньги возвращены обратно'
      new_game
    end
  end



  def dealer_give
    while card_amount(@dealer) <= 17
      add_card(@dealer)
      # puts "Дилер взял карту #{@dealer.hand[2].par}#{@dealer.hand[2].shirt} "
      # puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt} #{@dealer.hand[2].par}#{@dealer.hand[2].shirt}сумма карт #{card_amount(@dealer)}"
      if card_amount(@dealer) > card_amount(@human) && card_amount(@dealer) < 21
        @dealer.double_win
        # puts "Ты проиграл, Выйграл диллер. У диллера #{@dealer.coin}$, у тебя #{@human.coin}$"
        new_game
      elsif @human.double_win
          #  puts "Ты выиграл, у диллера #{card_amount(@dealer)}очков"
           new_game
      end
      if card_amount(@dealer) == 21
        # puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt}"
        @dealer.double_win
        # puts "Диллер выйграл сумма карт #{card_amount(@dealer)} У диллера #{@dealer.coin}$ у тебя #{@human.coin}$"
        new_game
      elsif card_amount(@dealer) > 21
        # puts "У диллера #{@dealer.hand[0].par}#{@dealer.hand[0].shirt} #{@dealer.hand[1].par}#{@dealer.hand[1].shirt}"
        @human.double_win
        # puts "У диллера больше 21, ты победил. У тебя #{@human.coin}$"
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
        start_round
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
