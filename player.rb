# parent class for dealer and human
class Player
  def deal
    @hand << @cards.reach
  end

  def add_bank
    @coin -= 10
  end

  def double_win
    @coin += 20
  end

  def win
    @coin += 10
  end

  def zero?
    @coin.zero?
  end

  def show_card
    @hand.each { |par| print "#{par} " }
  end

  def reset_cards
    @hand.clear
  end

  def scorer_values
    @scorer = 0
    @hand.each do |par|
      @scorer += par.rating.to_i
      @scorer += 10 if par.rating == 1 && @scorer + 10 <= 21
    end
    @scorer
  end
end
