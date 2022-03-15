os.setComputerLabel("Synak-Server")

for _, side in pairs({'back', 'top', 'left', 'right', 'bottom'}) do
    if (peripheral.getType(side) == "modem") then
        rednet.open(side)
        break
    end
end

multishell.launch({}, "/server.lua")
multishell.setTitle(2, "Server")