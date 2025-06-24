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
      local direction = math.atan2(targPosY - originalY, targPosX - originalX)
      local timer = 0
      self.moveUpdate = function ()
        timer = timer + system.getStorage("dt")
        if timer > 0.4 then
          local xv = 0
          local yv = 0
          
          xv = math.cos(direction)*self.speed * system.getStorage("dt")
          yv = math.sin(direction)*self.speed * system.getStorage("dt")

          self.x = self.x + xv
          self.y = self.y + yv
          
          -- snapping
          if math.abs(targPosX - self.x) < math.abs(xv*2)+1 and math.abs(targPosY - self.y) < math.abs(yv*2)+1 then
            self.x = targPosX
            self.y = targPosY
          end

          if main.forAllEntCollision(self, {"wall"}) then
            self.x = self.x - xv
            self.y = self.y - yv
            main.actionEnd()
          end

          if self.x == targPosX and self.y == targPosY then
            main.actionEnd()
          end
        end
      end
    end})
  end
end



function player:room(pos)
  if self.isPreview then

  else
    table.insert(self.moveOrder, {type="move", action=function ()
      local timer = 0
      self.moveUpdate = function ()
        timer = timer + system.getStorage("dt")
        if timer > 0.4 then
          main.forAllEntCollision(pos, {"wall"}, function (ent)
            ent:cut(pos)
          end)
          main.actionEnd()
        end
      end
    end})
  end
end