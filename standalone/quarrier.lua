local continue = true

while (continue) do
    turtle.digDown()
    turtle.down()
    for i=1, 16, 1 do
        turtle.turnRight()
        turtle.dig()
        turtle.turnRight()
        turtle.turnRight()
        turtle.dig()
        turtle.turnRight()
        if (i ~= 16) then
            turtle.dig()
            turtle.forward()
        end
    end
    turtle.turnRight()
    turtle.turnRight()
end
