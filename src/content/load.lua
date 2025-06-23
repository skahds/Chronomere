love.graphics.setBackgroundColor(1/3, 1/3, 1/3)

system.on("@load", function ()
  local ent1 = main.spawnEntity("wall", {x=20, y=10, width=100, height=100}, true)
  local ent2 = main.spawnEntity("wall", {x=120, y=15, width=50, height=70}, true)

  local player = main.spawnEntity("player", {x=270, y=50, width=100, height=100}, true)
  local preview = main.spawnEntity("player", {x=270, y=50, width=100, height=100, isPreview = true}, true)
  system.updateStorage("player", player)
  system.updateStorage("previewPlayer", preview)
  main.forAllEntCollision(ent1, {"env"}, function (targEnt)
    -- targEnt:delete()
  end)

  main.ui.spawnUI("start_turn", {x=500, y=50})
  main.ui.spawnUI("draw_card", {x=500, y=150, card="moveRook"})
end)