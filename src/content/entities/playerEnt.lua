main.entities.player = class(main.entities.basicEnt)
local player = main.entities.player
local basicEnt = main.entities.basicEnt

function player:init(args)
  basicEnt.init(self, args)

  self.tag = {"player"}
  self.moveOrder = {}
  -- self.isPreview = args.isPreview or false
end

function player:moveTo(pos)
  table.insert(self.moveOrder, {type="move", location=pos})
  -- if self.isPreview then
    
  -- end
end