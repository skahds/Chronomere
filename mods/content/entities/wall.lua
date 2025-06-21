main.entities.wall = class(main.entities.basicEnt)
local wall = main.entities.wall
local basicEnt = main.entities.basicEnt

function wall:init(args)
  basicEnt.init(self, args)

  self.color = {love.math.random(), love.math.random(), love.math.random()}
end