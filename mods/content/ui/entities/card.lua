main.ui.defineUI("blank_card", {
  width = 125,
  height = 175,
  image = "blank_card",
  renderLayer = 120,
  onClicked = function (ent, button)
    local mouse = system.getStorage("realMouse")
    if ent.card then
      main.card.selectCard(ent.card)
    end
  end
})