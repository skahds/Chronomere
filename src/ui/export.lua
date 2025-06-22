main.ui = {
  world = {},
  deleteQueue = {}
}

function main.ui.spawnUI(id, args, ret)
  local ent = main.entities[id]:new(args)
  table.insert(main.ui.world, ent)
  ent.index = #main.ui.world
  if ret then
    return ent
  end
end