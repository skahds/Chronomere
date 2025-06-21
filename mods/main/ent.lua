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
end

function basicEnt:draw()
  if self.color then
    love.graphics.setColor(self.color)
  end
  if self.image then
    local image = system.getImage(self.image)
    system.render(1, function ()
      love.graphics.draw(image, self.x, self.y)
    end)
  else
    system.render(1, function ()
      -- print("hi", self.x, self.y, self.width, self.height)
      love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    end)
  end
end

function basicEnt:delete()
  table.insert(main.deleteQueue, self)
end