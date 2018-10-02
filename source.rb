class Source


  def card_amount(player)
    player.scorer_values
  end

  def add_card(player)
    player.deal
  end

  def see_card
    @human.show_card
  end

  def see_dealer
    "У диллера #{@dealer.show_dealer} карты"
  end








end
