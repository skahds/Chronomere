local function getPlacingPosition(self)
  local mouse = system.getStorage("mouse")
  local mouseX = (mouse.x or 0)-self.width/2
  local mouseY = (mouse.y or 0)-self.height/2
  return {x=mouseX, y=mouseY}
end

main.entities.room_card = class(main.entities.card)
local card = main.entities.room_card
local originalCard = main.entities.card

function card:init(args)
  originalCard.init(self, args)
  self.isSelected = false
  self.width = args.width or 130
  self.height = args.height or 130
end

function card:draw()
  originalCard.draw(self)
  if self.isSelected then
    system.render(9, function ()  
      love.graphics.setColor(0.1, 0.8, 0.1)
      local pos = getPlacingPosition(self)
      love.graphics.rectangle("fill", pos.x, pos.y, self.width, self.height)
    end)
  end
end

function card:onDraw()
  originalCard.onDraw(self)
end

function card:onSelect()
  self.isSelected = true
end

function card:onDeselect()
  self.isSelected = false
end

function card:onPlay()
  self.isSelected = false
  local player = system.getStorage("previewPlayer")
  local pos = getPlacingPosition(self)
  main.card.actToPlayer("room", {x=pos.x, y=pos.y, width=self.width, height=self.height})
end