system.on("@update", function ()
  for _, card in pairs(main.card.deck.hand) do
    local cardUI = card.cardUI
    local screenW, screenH = system.getStorage("screenDimension").w, system.getStorage("screenDimension").h
    local cardWidth = cardUI.width
    local cardHeight = cardUI.height
    local distanceEachCard = 200/(#main.card.deck.hand/2+1)
    local orderOffset = (card.drawOrder+0.5)*distanceEachCard
    local leftOffset = -#main.card.deck.hand*(distanceEachCard/2)
    cardUI.x= screenW/2 + orderOffset + leftOffset - cardWidth/2
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
  if button == 1 then
    local card = main.card.deck.selection
    if card then
      main.card.play()
    end
  end
end)

local function reOrderRenderLayer()
  for _, card in pairs(main.card.deck.hand) do
    local cardUI = card.cardUI
    cardUI.renderLayer = 120 + card.drawOrder
  end
end

system.on("drawCard", function ()
  reOrderRenderLayer()
end)

system.on("cardDiscarded", function ()
  reOrderRenderLayer()
end)