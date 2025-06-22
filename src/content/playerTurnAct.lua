-- should this be a different name?
function main.actionEnd()
  local player = system.getStorage("player")
  player.moveUpdate = nil
  local currentAction = 0
  while true do
    currentAction = currentAction + 1
    if player.moveOrder[currentAction] then
      break
    end
  end
  player.moveOrder[currentAction] = nil
  if player.moveOrder[currentAction+1] then
    player.moveOrder[currentAction+1].action()
    system.call("endTurn")
  end
  
end

--
system.on("startTurn", function ()
  local player = system.getStorage("player")
  if #player.moveOrder > 0 then
    local move = player.moveOrder[1]
    if move then
      move.action()
    end
  end
end)