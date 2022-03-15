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


function main()
    local user = getUser("Noxius")

    if (not user) then
        user = createUser("Noxius")
    end

    print(textutils.serialise(user))
end

main()