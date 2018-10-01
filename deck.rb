# class for controlling the mechanics of card distribution
class Deck
  attr_accessor :cards, :deck

  def initialize
    @cards = Deck.build_deck
  end

  def self.build_deck
    @cards = []
    Card::SHIRTS.each do |shirt|
      Card::PARS.each do |par|
        @cards << Card.new(par, shirt)
      end
    end
    @cards.shuffle!
  end

  def remained
    @cards.length
  end

  def reach
    @cards.shift
  end

  def shuffle_cards
    @cards.shuffle!
  end
end
