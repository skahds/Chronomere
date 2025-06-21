system.on("@load", function ()
  local ent1 = main.spawnEntity("wall", {x=10, y=10, width=100, height=100, tag = {"env"}}, true)
  local ent2 = main.spawnEntity("wall", {x=50, y=50, width=100, height=100, tag = {"env"}}, true)

  local player = main.spawnEntity("player", {x=270, y=30, width=100, height=100, tag = {"env"}}, true)
  main.forAllEntCollision(ent1, {"env"}, function (targEnt)
    -- targEnt:delete()
  end)

  main.ui.spawnUI("test", {x=400, y=200})
end)