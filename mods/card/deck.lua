--the card inside these are entities
main.card = {
  deck = {
    draw = {},
    hand = {},
    discard = {}
  },
  selection = nil
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
    table.insert(deck.hand, deck.draw[#deck.draw])
    table.remove(deck.draw, #deck.draw)
  end
end

function main.card.selectCard(card)
  if card.onSelect then
    card:onSelect()
    system.call("cardSelected", card)
  end
  main.card.selection = card
end

function main.card.deselectCard()
  local card = main.card.selection
  if card.deSelect then
    card:deSelect()
    system.call("cardDeselected", card)
  end
  main.card.selection = nil
end

function main.card.play()
  if main.card.selection then
    main.card.selection:onPlay()
    system.call("cardPlayed", main.card.selection)
  end
  table.insert(deck.discard, main.card.selection)
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
  table.insert(deck.draw, card)
end