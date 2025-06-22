main.world = {}
main.deleteQueue = {}

function main.spawnEntity(id, args, ret)
  table.insert(main.world, main.entities[id]:new(args))
  main.world[#main.world].index = #main.world

  if ret then
    return main.world[#main.world]
  end
end

--tag is a table which has the tags to check if ent2 has
function main.checkEntCollision(ent1, ent2, tag)
  if main.AABB_check(ent1, ent2) then
    local usedTags = {}
    for _, entTag in pairs(ent2.tag) do
      usedTags[entTag] = true
    end
    for _, checkTag in pairs(tag) do
      if usedTags[checkTag] then
        return true
      end
    end
  end
end

function main.forAllEntCollision(ent, tag, func)
  for _, targEnt in pairs(main.world) do
    if ent.index ~= targEnt.index and main.checkEntCollision(ent, targEnt, tag) then
      func(targEnt)
    end
  end
end