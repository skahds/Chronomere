main.entities.wall = class(main.entities.basicEnt)
local wall = main.entities.wall
local basicEnt = main.entities.basicEnt
local color = {love.math.random(), love.math.random(), love.math.random()}

function wall:init(args)
  basicEnt.init(self, args)

  self.color = color
  self.tag = {"wall", "env"}
  self.outlineSize = 5
end

function wall:draw()
  system.render(-10, function ()
    -- later on i will change this
    love.graphics.setColor(0.2, 0.2, 0.2)
    local s = self.outlineSize
    love.graphics.rectangle("fill", self.x-s, self.y-s, self.width+s*2, self.height+s*2)
  end)
  basicEnt.draw(self)
end

-- this is AI generated since i gave up
function wall:cut(block)
    if not (block.x and block.y and block.width and block.height) then
        print("Error: Block must have x, y, width, height properties.")
        return
    end

    local intersection = utils.getRectIntersection(self, block)

    if not intersection then
        return
    end

    self:delete()

    
    local newPieces = {}

    -- Piece above the intersection
    if self.y < intersection.y then
        table.insert(newPieces, {
            x = self.x,
            y = self.y,
            width = self.width,
            height = intersection.y - self.y
        })
    end

    -- Piece below the intersection
    if (self.y + self.height) > (intersection.y + intersection.height) then
        table.insert(newPieces, {
            x = self.x,
            y = intersection.y + intersection.height,
            width = self.width,
            height = (self.y + self.height) - (intersection.y + intersection.height)
        })
    end

    -- Piece to the left of the intersection (within the vertical bounds of the intersection)
    if self.x < intersection.x then
        local pieceY = math.max(self.y, intersection.y)
        local pieceHeight = math.min(self.y + self.height, intersection.y + intersection.height) - pieceY
        if pieceHeight > 0 then -- Ensure non-zero height
            table.insert(newPieces, {
                x = self.x,
                y = pieceY,
                width = intersection.x - self.x,
                height = pieceHeight
            })
        end
    end

    -- Piece to the right of the intersection (within the vertical bounds of the intersection)
    if (self.x + self.width) > (intersection.x + intersection.width) then
        local pieceY = math.max(self.y, intersection.y)
        local pieceHeight = math.min(self.y + self.height, intersection.y + intersection.height) - pieceY
        if pieceHeight > 0 then -- Ensure non-zero height
            table.insert(newPieces, {
                x = intersection.x + intersection.width,
                y = pieceY,
                width = (self.x + self.width) - (intersection.x + intersection.width),
                height = pieceHeight
            })
        end
    end

    for _, piece in ipairs(newPieces) do
        if piece.width > 0 and piece.height > 0 then
            main.spawnEntity("wall", piece)
        end
    end
end