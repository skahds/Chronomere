--the card inside these are entities
main.card = {
  deck = {
    draw = {},
    hand = {},
    discard = {},
    selection = nil
  }
}

local deck = main.card.deck
function main.card.drawCard()
  if #deck.draw < 1 and #deck.discard > 0 then
    main.card.shuffleDiscardToDraw()
  end
  if #deck.draw > 0 then
    if #deck.draw > 0 then
      utils.shuffle(deck.draw)
    end
    
    system.call("cardDrawn", deck.draw[#deck.draw])
    if deck.draw[#deck.draw].onDraw then
      deck.draw[#deck.draw]:onDraw()
    end
    table.insert(deck.hand, deck.draw[#deck.draw])
    table.remove(deck.draw, #deck.draw)
  end
end

function main.card.selectCard(card)
  main.card.deselectCard()
  if card.onSelect then
    card:onSelect()
    system.call("cardSelected", card)
  end
  deck.selection = card
end

function main.card.deselectCard()
  local card = deck.selection
  if card and card.onDeselect then
    card:onDeselect()
    system.call("cardDeselected", card)
  end
  deck.selection = nil
end

function main.card.play()
  local card = deck.selection
  if card then
    if card.onPlay then
      card:onPlay()
    end
    system.call("cardPlayed", card)

    main.card.discard(card)

    main.card.deselectCard()
  end
end

function main.card.discard(card)
  local drawOrder = card.drawOrder
  for _, c in pairs(deck.hand) do
    if c.drawOrder > drawOrder then
      c.drawOrder = c.drawOrder - 1
    end
  end
  system.call("cardDiscarded", card)

  table.insert(deck.discard, card)
  table.remove(deck.hand, card.drawOrder+1)
  card.cardUI:delete()
end

function main.card.shuffleDiscardToDraw()
  for i=#deck.discard, 1, -1 do
    table.insert(deck.draw)
    table.remove(deck.discard, #deck.discard)
  end
  system.call("deckShuffled")
end

function main.card.addCardToDeck(card)
  local card = card
  if type(card) == "string" then
    card = main.spawnEntity(card, {}, true)
  end
  table.insert(deck.draw, card)
end