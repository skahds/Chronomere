main.entities.player = class(main.entities.basicEnt)
local player = main.entities.player
local basicEnt = main.entities.basicEnt

function player:init(args)
  basicEnt.init(self, args)

  self.tag = {"player"}
  self.moveOrder = {}
  self.isPreview = args.isPreview or false

  if self.isPreview then
    self.color = {1, 1, 1, 0.4}
  end
end

function player:moveTo(pos)
  if self.isPreview then
    self.x = pos.x
    self.y = pos.y
    local realPlayer = system.getStorage("player")
    table.insert(realPlayer.moveOrder, {type="move", location=pos})
  else
    table.insert(self.moveOrder, {type="move", location=pos})
  end
end