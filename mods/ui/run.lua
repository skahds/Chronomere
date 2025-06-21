system.on("@mouse:released", function (button)
  for _, ent in pairs(main.ui.world) do
    if ent.onClicked then
      -- no need to check AABB, just have it check it themself for flexibility
      ent.onClicked(ent, button)
    end
  end
end)

system.on("@update", function ()
  for _, ent in pairs(main.ui.world) do
    if ent.update then
      ent:update()
    end
  end

  for i=#main.ui.deleteQueue, 1, -1 do
    local ent = main.ui.deleteQueue[i]
    local entIndex = ent.index

    if ent.index ~= #main.ui.world then
      local lastEnt = main.ui.world[#main.ui.world]
      main.ui.world[entIndex] = lastEnt
      lastEnt.index = entIndex
    end

    table.remove(main.ui.world, #main.ui.world)
  end
  main.ui.deleteQueue = {}
end)

system.on("@renderer:render", function ()
  for _, ent in pairs(main.ui.world) do
    if ent.draw then
      ent:draw()
    end
  end
end)