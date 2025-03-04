local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/Gamelist.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
