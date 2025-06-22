main.entities.player = class(main.entities.basicEnt)
local player = main.entities.player
local basicEnt = main.entities.basicEnt

function player:init(args)
  basicEnt.init(self, args)

  self.tag = {"player"}
  self.moveOrder = {}
  self.isPreview = args.isPreview or false
  self.speed = args.speed or 300

  if self.isPreview then
    self.color = {1, 1, 1, 0.4}
  end
end

function player:update()
  -- since basicEnt doesn't have update rn
  if basicEnt.update then
    basicEnt.update(self)
  end

  if self.moveUpdate then
    self.moveUpdate()
  end
end

function player:moveTo(pos)
  -- self.x is based on it's early one
  local originalX = self.x
  local originalY = self.y
  if self.isPreview then
    self.x = pos.x + originalX
    self.y = pos.y + originalY
  else
    table.insert(self.moveOrder, {type="move", action=function ()
      local originalX = self.x
      local originalY = self.y
      local targPosX = pos.x + originalX
      local targPosY = pos.y + originalY
      local xv = 0
      local yv = 0
      self.moveUpdate = function ()
        -- ill make this correctly later
        if self.x < targPosX then
          xv = self.speed * system.getStorage("dt")
        elseif self.x > targPosX then
          xv = -self.speed * system.getStorage("dt")
        end

        if self.y < targPosY then
          yv = self.speed * system.getStorage("dt")
        elseif self.y > targPosY then
          yv = -self.speed * system.getStorage("dt")
        end

        if math.abs(self.x - targPosX) < 2 then
          xv = targPosX - self.x
        end
        if math.abs(self.y - targPosY) < 2 then
          yv = targPosY - self.y
        end

        self.x = self.x + xv
        self.y = self.y + yv

        if main.forAllEntCollision(self, {"wall"}) then
          self.x = self.x - xv
          self.y = self.y - yv
          main.actionEnd()
        end

        if self.x == targPosX and self.y == targPosY then
          main.actionEnd()
        end
      end
    end})
  end
end