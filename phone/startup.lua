
local maxX, maxY = term.getSize()

print(maxX, maxY)

term.setBackgroundColor(colors.black)
term.setTextColor(colors.black)

for x = 1, maxX, 1 do
    for y = 1, maxY, 1 do
        term.setCursorPos(x,y)
        term.write(" ")
    end
end

term.setBackgroundColor(colors.cyan)
term.setTextColor(colors.black)
term.setCursorPos(1,1)
term.write(maxX.." "..maxY)

sleep(2)

local activeMenu = "home"

local components = {
    home = {
        LoginButton = {
            minX = 2,
            maxX = 6,
            minY = 2,
            maxY = 2,
        },
    },
}

function menuSelect()

end

function refreshDisplay()
    if (activeDisplay == "home") then
        drawDisplay(activeDisplay)
    end
end

-- while (true) do
--     local eventName, button, x, y = os.pullEvent()


--     -- print(event, button, x, y)
-- end