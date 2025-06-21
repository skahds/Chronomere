main.world = {}
main.deleteQueue = {}

function main.spawnEntity(id, args)
  table.insert(main.world, main.entities[id]:new(args))
end