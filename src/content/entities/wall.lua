main.entities.wall = class(main.entities.basicEnt)
local wall = main.entities.wall
local basicEnt = main.entities.basicEnt
local color = {love.math.random(), love.math.random(), love.math.random()}

function wall:init(args)
  basicEnt.init(self, args)

  self.color = color
  self.tag = {"wall", "env"}
  self.outlineSize = 5
end

function wall:draw()
  system.render(-10, function ()
    -- later on i will change this
    love.graphics.setColor(0.2, 0.2, 0.2)
    local s = self.outlineSize
    love.graphics.rectangle("fill", self.x-s, self.y-s, self.width+s*2, self.height+s*2)
  end)
  basicEnt.draw(self)
end