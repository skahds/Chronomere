main.entities.card = class(main.entities.basicEnt)
local card = main.entities.card
local basicEnt = main.entities.basicEnt

function card:init(args)
  basicEnt.init(self, args)

  self.tag = {}
end

function card:draw()
  
end

function card:onDraw()
  self.drawOrder = #main.card.deck.hand
  local screenW, screenH = system.getStorage("screenDimension").w, system.getStorage("screenDimension").h
  self.cardUI = main.ui.spawnUI("blank_card", {x=#main.card.deck.hand*200, y=screenH-150}, true)
  self.cardUI.card = self
end