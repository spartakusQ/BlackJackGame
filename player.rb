# parent class for dealer and human
class Player
  attr_accessor :hand, :cards, :coin

  def initialize(name)
    @name = name
    @coin = 100
    @cards = Deck.new
    @hand = []
  end

  def deal
    @hand << @cards.reach
  end

  def rate
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
    @hand.each { |card| print "#{card} " }
  end

  def show_dealer
    @hand.size { |_card| print '*  ' }
  end

end
