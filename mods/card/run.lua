system.on("@update", function ()
  for _, card in pairs(main.card.deck.hand) do
    local cardUI = card.cardUI
    local screenW, screenH = system.getStorage("screenDimension").w, system.getStorage("screenDimension").h
    local cardWidth = cardUI.width
    local cardHeight = cardUI.height
    cardUI.x= screenW/2 + (cardUI.drawOrder*200) - #main.card.deck.hand*100 + cardWidth/2
    cardUI.y=screenH-cardHeight/2
  end
  if main.card.deck.selection then
    local screenH = system.getStorage("screenDimension").h
    local card = main.card.deck.selection
    local cardHeight = card.cardUI.height
    card.cardUI.y=screenH-cardHeight
  end
end)

system.on("noUIClicked", function (button)
  if button == 2 then
    main.card.deselectCard()
  end
end)