-- for use with specific card class, not the original card class
function main.card.defineCard()
  
end

function main.card.actToPlayer(id, e)
  local preview = system.getStorage("previewPlayer")
  local player = system.getStorage("player")
  preview[id](preview, e)
  player[id](player, e)
end