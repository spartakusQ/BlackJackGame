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
    puts "Банк игры равен = #{@game.show_bank}"
    see_table_human
    see_table_dealer
    
    
    
    menu
  end

  def see_table_human
    puts "У вас на руках карты #{@game.player_hand}, сумма ваших карт равна #{@game.human_scores} банк игрока равен = #{@game.human_coin}$"
  end

  def see_table_dealer
    puts "У диллера на руках #{@game.see_dealer} карты и банк диллера равен = #{@game.dealer_coin}$"
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
    puts "Вы взяли карту #{@game.human_see_add_card} теперь у вас руках #{@game.player_hand + ' ' + @game.human_see_add_card}: сумма карт равна  #{@game.human_scores}"
    if @game.human_scores > 21
      @game.dealer_win
       puts "Вы проиграли - Выйграл диллер - банк диллера = #{@game.dealer_coin}$ - ваш банк = #{@game.human_coin}$"
       exit
    elsif @game.human_scores == 21
      puts "У диллера на руках карты: #{@game.show_dealer_card}"
      if @game.human_scores < @game.dealer_scores
        puts 'Выйграл игрок'
        @game.human_win
      else
        puts 'Выйграл диллер'
        @game.dealer_win
      end
    else
      puts %(Решайте что делаем дальше:
            1- Взять ещё одну карту
            2- Открыться)
        give_input = gets.to_i
        case give_input
        when 1 then @game.human_add_card
          puts "Вы взяли карту #{@game.human_see_add_card} теперь у вас руках #{@game.player_hand + ' ' + @game.human_see_add_card}: сумма карт равна  #{@game.human_scores}"


        when 2 then 
         puts "У диллера на руках карты: #{@game.show_dealer_card} сумма карт равна #{@game.dealer_scores}"
          if @game.human_scores < @game.dealer_scores
            puts 'Выйграл игрок'
            @game.human_win
            exit
          else
            puts 'Выйграл диллер'
            @game.dealer_win
            exit
          end
        when 0 then exit
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
