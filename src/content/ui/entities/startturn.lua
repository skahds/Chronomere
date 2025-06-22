main.ui.defineUI("start_turn", {
  width = 100,
  height = 100,
  image = "start_turn",
  onClicked = function (ent, button)
    system.call("startTurn")
  end
})