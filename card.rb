# class for managing a deck of cards
class Card
  attr_reader :card, :shirt,
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SHIRTS = ['♠', '♣', '♦', '♥']

  def initialize(card, shirt)
    @card = rank
    @shirt = shirt
  end
end
