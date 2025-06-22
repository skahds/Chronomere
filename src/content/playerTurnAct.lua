--movement
system.on("startTurn", function ()
  local player = system.getStorage("controlledPlayer")
  if #player.moveOrder > 0 then
    for _, action in pairs(player.moveOrder) do
      if action.type == "move" then
        player.x = action.location.x
        player.y = action.location.y
      end
    end
  end
end)