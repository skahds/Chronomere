main.ui.defineUI("blank_card", {
  width = 125,
  height = 175,
  image = "blank_card",
  renderLayer = 120,
  onClicked = function (ent, button)
    if ent.card then
      if (main.card.deck.selection == nil) or (ent.card.drawOrder ~= main.card.deck.selection.drawOrder) then
        main.card.selectCard(ent.card)
      else
        main.card.deselectCard()
      end

    end
  end
})