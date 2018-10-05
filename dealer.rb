require_relative 'player'
# class for controlling the mechanics of the dealer
class Dealer < Player
  attr_accessor :hand, :cards, :coin

  def initialize(name)
    @name = name
    @coin = 100
    @bank = 0
    @cards = Deck.new
    @hand = []
  end

  def show_dealer
    @hand.size { |_par| print '*  ' }
  end

  def show_dealer_open
    @hand[0].par + @hand[0].shirt + ' ' + @hand[1].par + @hand[1].shirt
  end

  def see_dealer_change
    @hand[2].par + @hand[2].shirt
  end
end
