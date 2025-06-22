-- this function is quite redundent, high chance to be deleted later, but it is what it is
local function getClosest(origin)
  local mouse = system.getStorage("mouse")
  local mouseX = mouse.x - (origin.x+origin.width/2)
  local mouseY = mouse.y - (origin.y+origin.height/2)
  if math.abs(mouseX) > math.abs(mouseY) then
    return {x=mouseX, y=0}
  else
    return {x=0, y=mouseY}
  end
end

main.entities.move_card = class(main.entities.card)
local card = main.entities.move_card
local originalCard = main.entities.card

function card:init(args)
  originalCard.init(self, args)
  self.isSelected = false
end

function card:draw()
  originalCard.draw(self)
  if self.isSelected then
    local player = system.getStorage("previewPlayer")
    local offset = getClosest(player)
    system.render(9, function ()  
      love.graphics.setColor(0.1, 0.8, 0.1)
      love.graphics.rectangle("fill", player.x+offset.x, player.y+offset.y, player.width, player.height)
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
  local moveDelta = getClosest(player)

  if player and player.moveTo then
    player:moveTo({x=player.x+moveDelta.x, y=player.y+moveDelta.y})
  end
end