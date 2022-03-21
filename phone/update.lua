local devURL = "http://server.noxius.xyz:5500/"
local mainURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/main/"
local path = "phone/"
local useDevServer = true
local updateDelay = 1

local files = {
    "startup.lua",
    "update.lua",
}

function download(fileName)
    if (useDevServer) then
        print("Downloading "..fileName.." from Development server.")
        request = http.get(devURL..path..fileName)

        if (not request) then
            print("Development server offline")
            useDevServer = false;
            download(fileName)
        end
    else
        print("Downloading "..fileName.." from Live server.")
        request = http.get(mainURL..path..fileName)
    end

    print("Installing "..fileName)
    data = request.readAll()
    
    if (fs.exists(fileName)) then
        fs.delete(fileName)
    end

    local file = fs.open(fileName, "w")
    file.write(data)
    file.close()

    print("Downloaded file to "..fileName.."\n")
end

for _, file in pairs(files) do
    download(file)
end

print("Rebooting...")
os.sleep(updateDelay)
os.reboot()