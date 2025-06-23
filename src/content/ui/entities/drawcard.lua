main.ui.defineUI("draw_card", {
  width = 100,
  height = 100,
  image = "draw_card",
  onClicked = function (ent, button)
    if love.math.random() > 0.5 then
      main.card.addCardToDeck("room_card")
    else
      main.card.addCardToDeck("move_card")
    end
    main.card.drawCard()
  end
})