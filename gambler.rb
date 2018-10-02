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
end
