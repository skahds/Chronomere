main.ui.defineUI("draw_card", {
  width = 100,
  height = 100,
  image = "draw_card",
  onClicked = function (ent, button)
    main.card.addCardToDeck("move_card")
    main.card.drawCard()
  end
})