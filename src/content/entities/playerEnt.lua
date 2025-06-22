main.entities.player = class(main.entities.basicEnt)
local player = main.entities.player
local basicEnt = main.entities.basicEnt

function player:init(args)
  basicEnt.init(self, args)

  self.tag = {"player"}
end