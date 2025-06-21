main.ui.defineUI("test", {
  width = 100,
  height = 100,
  onClicked = function (ent, button)
    local mouse = system.getStorage("realMouse")
    if main.AABB_check(ent, mouse) then
      print("pressed")
    end
  end
})