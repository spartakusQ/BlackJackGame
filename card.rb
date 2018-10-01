# class for managing a deck of pars
class Card
  attr_reader :par, :shirt
  PARS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SHIRTS = ['♠', '♣', '♦', '♥'].freeze

  def initialize(par, shirt)
    @par = par
    @shirt = shirt
  end

  def rating
    return @par if %w[2 3 4 5 6 7 8 9 10].include?(par)
    return 10 if %w[J Q K].include?(par)
    return 1 if par == 'A'

    @rating
  end
end
