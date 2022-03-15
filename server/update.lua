local githubURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/main/"

urls = {
    {"test",  githubURL.."server/test.lua"},
    {"server", githubURL.."server/server.lua"},
    {"update", githubURL.."server/update.lua"}
}

function download(name, url)
    print("Updating " .. name)
 
    request = http.get(url)
    data = request.readAll()
    
    if fs.exists(name) then
        fs.delete(name)
    end

    file = fs.open(name, "w")
    file.write(data)
    file.close()

    print("Successfully downloaded " .. name .. "\n")
end

for key, value in ipairs(urls) do
    download(unpack(value))
end

term.clear()
term.setCursorPos()