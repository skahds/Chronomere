main.ui.defineUI("draw_card", {
  width = 100,
  height = 100,
  image = "draw_card",
  onClicked = function (ent, button)
    local mouse = system.getStorage("realMouse")
    if main.AABB_check(ent, mouse) then
      main.card.addCardToDeck("card")
      main.card.drawCard()
    end
  end
})