require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'gambler'
require_relative 'player'
# class to manage the game
class Game
  attr_accessor :cards, :deck, :hand, :player, :coin

  def initialize
    @deck = Deck.new
    @human = Gambler.new(@name)
    @dealer = Dealer.new('Dealer')
  end

  def start_round
    2.times { @human.deal }
    2.times { @dealer.deal }
    @human.add_bank
    @dealer.add_bank
  end

  # показать руку игрока
  def player_hand
    @human.show_gambler
  end

  # показать руку диллера (только количество карт)
  def see_dealer
     @dealer.show_dealer
  end

  # добавить карту в руку игрока
  def human_add_card
    @human.deal
  end

  # добавить карту в руку дилера
  def dealer_add_card
    @dealer.deal
  end

  # показать руку диллера (открыться)
  def show_dealer_card
    @dealer.show_dealer_open
  end

  # добавить карту в руку диллера
  def show_dealer_add_card
    @dealer.see_dealer_change
  end

  def human_see_add_card
    @human.see_gambler_change
  end

  def human_scores
    @human.scorer_values
  end

  def dealer_scores
    @dealer.scorer_values
  end

  def see_human
    @human.show_card
  end

  def human_win
    @human.double_win
  end

  def dealer_win
    @dealer.double_win
  end

  def human_coin
    @human.coin
  end

  def dealer_coin
    @dealer.coin
  end

  def human_zero
    @human.zero?
  end

  def dealer_zero
    @dealer.zero?
  end

  def human_reset_cards
    @human.reset_cards
  end

  def dealer_reset_cards
    @dealer.reset_cards
  end
end
