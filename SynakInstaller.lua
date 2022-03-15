local args = {...}
local githubURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/main/"
local p = "swickson"

local modules = {
    update = {
        url = githubURL.."SynakInstaller.lua",
        path = "/synak",
        execute = true
    },
    server = {
        url = githubURL.."server/update.lua",
        path = "/update.lua",
        execute = false
    }
}

function downloadScript(script)
    clear()
    print("Installing "..script)
    request = http.get(modules[script].url)
    data = request.readAll()

    if (fs.exists(modules[script].path)) then
        fs.delete(modules[script].path)
    end
    
    file = fs.open(modules[script].path, "w")
    file.write(data)
    file.close()
    
    print("Successfully downloaded "..script)
    if (modules[script].execute) then
        shell.run(modules[script].path)
    end
end

function help()
    clear()
    print("Welcome to Synak.")
    print("Commands:")
    print("help")
    print("install")
    print("update")
    print("purge")
end

function install()
    clear()
    if (#args == 1) then
        print("Please choose one of the following Modules")
        print("1. Server")
        term.write("> ")
        target = read():lower()
    
        if (target == "1" or target == "server") then
            term.write("\nEnter Password:")
            password = read()
            if (password == p) then
                installScript(target)
            else
                print("Invalid password")
            end
        else
            print("Module not found")
        end
    else
        installScript(args[2])
    end
end

if (#args == 0) then
    help()
else
    if (args[1] == "help") then
        help()
    elseif (args[1] == "update") then
        downloadScript("update")
    elseif (args[1] == "install") then
        install()
    end
end

function clear()
    term.clear()
    term.setCursorPos(1,1)
end