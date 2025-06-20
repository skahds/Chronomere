local renderTable = {}
local renderKeys = {}

system.render =  function (layer, func)
  if renderTable[layer] == nil then
    renderTable[layer] = {}
    table.insert(renderKeys, layer)
  end
  table.insert(renderTable[layer], func)
end

system.on("@renderer:render", function ()
  table.sort(renderKeys)

  for i, layer in ipairs(renderKeys) do
    for _, func in ipairs(renderTable[layer]) do
      func()
      love.graphics.setColor(1, 1, 1)
    end
  end

  renderTable = {}
  renderKeys = {}
end)