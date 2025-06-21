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
  main.card.deck.selection = card
end

function main.card.deselectCard()
  local card = main.card.deck.selection
  if card and card.deSelect then
    card:deSelect()
    system.call("cardDeselected", card)
  end
  main.card.deck.selection = nil
end

function main.card.play()
  if main.card.deck.selection then
    main.card.deck.selection:onPlay()
    system.call("cardPlayed", main.card.deck.selection)
  end
  table.insert(deck.discard, main.card.deck.selection)
  table.remove(deck.hand, #deck.hand)
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
    card = main.entities[card]:new({})
  end
  table.insert(deck.draw, card)
end