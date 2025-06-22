--movement
system.on("startTurn", function ()
  local player = system.getStorage("player")
  if #player.moveOrder > 0 then
    print(#player.moveOrder)
    for i, action in ipairs(player.moveOrder) do
      print("yo", action)
      if action.type == "move" then
        player.x = action.location.x
        player.y = action.location.y
      end

      player.moveOrder[i] = nil
    end
  end
end)