-- for use with specific card class, not the original card class
function main.card.defineCardUI(id, args)
  local t = {}
  for k, v in pairs(args) do
    t[k] = utils.deepCopy(v)
  end

  t.onClicked = function (ent, button)
    if ent.card then
      if (main.card.deck.selection == nil) or (ent.card.drawOrder ~= main.card.deck.selection.drawOrder) then
        main.card.selectCard(ent.card)
      else
        main.card.deselectCard()
      end
    end
  end
  
  main.ui.defineUI(id, t)
end

function main.card.actToPlayer(id, e)
  local preview = system.getStorage("previewPlayer")
  local player = system.getStorage("player")
  --just leave it like this so if something wrong happens it throws an error
  preview[id](preview, e)
  player[id](player, e)
end