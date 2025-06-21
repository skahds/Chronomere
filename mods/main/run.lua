system.on("@update", function ()
  for _, ent in pairs(main.world) do
    if ent.update then
      ent:update()
    end
  end
end)

system.on("@renderer:render", function ()
  for _, ent in pairs(main.world) do
    if ent.draw then
      ent:draw()
    end
  end
end)