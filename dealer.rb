require_relative 'player'
# class for controlling the mechanics of the dealer
class Dealer < Player
  def initialize(name)
    @name = name
    @coin = 100
    @cards = Deck.new
    @hand = []
  end


  
end
