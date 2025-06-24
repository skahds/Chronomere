-- main.ui.defineUI("blank_card", {
--   width = 125,
--   height = 175,
--   image = "blank_card",
--   renderLayer = 120,
--   onClicked = function (ent, button)
--     if ent.card then
--       if (main.card.deck.selection == nil) or (ent.card.drawOrder ~= main.card.deck.selection.drawOrder) then
--         main.card.selectCard(ent.card)
--       else
--         main.card.deselectCard()
--       end

--     end
--   end,
--   onDraw = function (ent)
--     if ent.card and ent.card.name then
--       system.render(ent.renderLayer, function ()
--         love.graphics.print(ent.card.name, ent.x+10, ent.y+10)
--       end, true)
--     end
--   end
-- })
local cardFont = love.graphics.newFont(24)
main.card.defineCardUI("move_card", {
  width = 125,
  height = 175,
  image = "blank_card",
  renderLayer = 120,
  onDraw = function (ent)
    if ent.card and ent.card.name then
      system.render(ent.renderLayer, function ()
        love.graphics.setFont(cardFont)
        love.graphics.print("Move", ent.x+10, ent.y+10)
      end, true)
    end
  end
})

main.card.defineCardUI("room_card", {
  width = 125,
  height = 175,
  image = "warp_card",
  renderLayer = 120,
  onDraw = function (ent)
    if ent.card and ent.card.name then
      system.render(ent.renderLayer, function ()
        love.graphics.setFont(cardFont)
        love.graphics.print("Room", ent.x+10, ent.y+10)
      end, true)
    end
  end
})