require_relative 'player'
# class for controlling the mechanics of the gambler
class Gambler < Player
  attr_accessor :hand, :cards, :coin

  def initialize(name)
    @name = name
    @coin = 100
    @cards = Deck.new
    @hand = []
  end

  def show_gambler
    @hand[0].par + @hand[0].shirt + ' ' + @hand[1].par + @hand[1].shirt
  end

  def see_gambler_change
    @hand[2].par + @hand[2].shirt
  end
end
