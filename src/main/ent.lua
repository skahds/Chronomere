main.entities = {}

main.entities.basicEnt = class()
local basicEnt = main.entities.basicEnt

function basicEnt:init(args)
  for k, v in pairs(args) do
    if type(k) == "table" then
      self[k] = utils.deepCopy(v)
    else
      self[k] = v
    end
  end

  self.x = self.x or 0
  self.y = self.y or 0
  self.width = self.width or self.defaultWidth or 0
  self.height = self.height or self.defaultHeight or 0
  self.tag = self.tag or {}
  self.cameraFixed = self.cameraFixed or false
  self.renderLayer = self.renderLayer or 10
end

function basicEnt:draw()
  local renderLayer = self.renderLayer
  system.render(renderLayer, function ()

    if self.color then
      love.graphics.setColor(self.color)
    else
      love.graphics.setColor(1, 1, 1)
    end
    
    if self.image then
      local image = system.getImage(self.image)
        love.graphics.draw(image, self.x, self.y)

    else
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    end
  end, self.cameraFixed)
end

function basicEnt:delete()
  local isIn = false
  for _, ent in pairs(main.deleteQueue) do
    if ent.index == main.deleteQueue then
      isIn = true
    end
  end
  
  if isIn == false then
    table.insert(main.deleteQueue, self)
    system.call("main:entityDeleted", self)
  end
end