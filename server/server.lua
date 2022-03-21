function establishFolderStructure()
    local folders = {
        "/data",
        "/data/users",
    }
end

function getUser(username)
    local file = fs.open("/data/users/"..username, "r")
    if (not file) then
        return nil
    else
        return textutils.unserialise(file.readAll())
    end
end

function updateUser(user, value)

end

function createUser(username)
    local file = fs.open("/data/users/"..username, "w")
    local user = {
        id = 1,
        username = username
    }

    file.write(textutils.serialise(user))
    file.close()

    return user
end

function rednetMessage(senderID, payload, protocol)
    local data = textutils.unserialiseJSON(payload)
    local struc = {
        messageType = "create_user",
        username = "Noxius",
    }

    
    if (protocol == "create_user") then
        
    end

    local response = {
        "taken" == true
    }
    -- rednet.send(senderID, textutils.serialiseJSON(response), "ssr_"..data.messageType)
end

function eventListener()
    local listening = true
    while (listening) do
        event = {os.pullEvent()}
        local eventName = event[1]

        if (eventName == "rednet_message") then
            rednetMessage(event[2], event[3], event[4])
        end
    end
end


function main()
    local user = getUser("Noxius")

    if (not user) then
        user = createUser("Noxius")
    end

    print(textutils.serialise(user))
end

main()