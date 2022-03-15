local args = {...}
local githubURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/main/SynakInstaller.lua"

function installScript(script)
    print("Installing "..script)
end

function update()
    clear()
    print("Downloading lastest version")
    request = http.get(githubURL)
    data = request.readAll()

    if (fs.exists("/synak")) then
        fs.delete("/synak")
    end

    file = fs.open("/synak", "w")
    file.write(data)
    file.close()

    print("Successfully updated to latest version")
end

if (#args == 0) then
    clear()
    print("Welcome to Synak.")
    print("Commands:")
    print("help")
    print("install")
    print("update")
    print("purge")
else
    if (args[1] == "help") then
        clear()
        print("Why do you need help")
    elseif (args[1] == "update") then
        update()
    elseif (args[1] == "install") then
        clear()
        if (#args == 1) then
            print("Please choose one of the following Modules")
            print("1. Server")
            term.write("> ")
            target = read():lower()

            if (target == "1" or target == "server") then
                installScript(target)
            else
                print("Module not found")
            end
        else
            installScript(args[2])
        end
    end
end

function clear()
    term.clear()
    term.setCursorPos(1,1)
end