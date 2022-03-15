local args = {...}

local pasteID = "MjVMrLBr"
local githubURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/main/SynakInstaller.lua"

function installScript(script)
    print("Installing "..script)
end

function update()
    print("\n\n")
    print("Downloading lastest version")
    -- request = http.get("https://pastebin.com/raw/"..pasteID)
    request = http.get(githubURL)
    data = request.readAll()

    if (fs.exists("/synak")) then
        fs.delete("/synak")
    end

    file = fs.open("/synak", "w")
    file.write(data)
    file.close()

    print("Successfully updated to latest version")
    shell.run("synak", "help")
end

if (#args == 0) then
    print("Welcome to Synak.")
    print("Commands:")
    print("help")
    print("install")
    print("update")
    print("purge")
else
    if (args[1] == "help") then
        print("Why do you need help")
    elseif (args[1] == "update") then
        update()
    elseif (args[1] == "install") then
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


-- function download(name, url)
--   print("Updating " .. name)
 
--   request = http.get(url)
--   data = request.readAll()
 
--   if fs.exists(name) then
--     fs.delete(name)
--     file = fs.open(name, "w")
--     file.write(data)
--     file.close()
--   else
--     file = fs.open(name, "w")
--     file.write(data)
--     file.close()
--   end
 
--   print("Successfully downloaded " .. name .. "\n")
-- end

-- for key, value in ipairs(urls) do
--     download(unpack(value))
-- end

-- term.clear()
-- term.setCursorPos()