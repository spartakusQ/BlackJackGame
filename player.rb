# parent class for dealer and human
class Player
  attr_accessor :hand, :cards, :coin

  def initialize(name)
    @name = name
    @coin = 100
    @cards = Deck.new
    @hand = []
  end

end
