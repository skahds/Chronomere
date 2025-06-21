function main.AABB_check(t1, t2)
  local x1,y1,x2,y2,w1,h1,w2,h2=t1.x,t1.y,t2.x,t2.y,t1.width,t1.height,t2.width,t2.height
  
  if x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    y1 + h1 > h2 then
      return true
  end

end