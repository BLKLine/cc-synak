-- Update script
-- Automatically downloads ComputerCraft programs to a computer

local masterURL = "https://raw.githubusercontent.com/BLKLine/cc-synak/master/"

urls = {
    {"test",  masterURL.."server/test.lua"},
    {"server", masterURL.."server/server.lua"},
    {"update", masterURL.."server/update.lua"}
}

function download(name, url)
  print("Updating " .. name)
 
  request = http.get(url)
  data = request.readAll()
 
  if fs.exists(name) then
    fs.delete(name)
    file = fs.open(name, "w")
    file.write(data)
    file.close()
  else
    file = fs.open(name, "w")
    file.write(data)
    file.close()
  end
 
  print("Successfully downloaded " .. name .. "\n")
end

for key, value in ipairs(urls) do
    download(unpack(value))
end

term.clear()
term.setCursorPos()