main.ui.defineUI("card", {
  width = 100,
  height = 200,
  image = "blank_card",
  onClicked = function (ent, button)
    local mouse = system.getStorage("realMouse")
    if main.AABB_check(ent, mouse) then
      system.call("cardSelected", ent.card)
    end
  end
})