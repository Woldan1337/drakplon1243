-- Script URL'lerini tanımlayalım
local urls = {
    "https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/Derp.lua",
    "https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/GlowESP.lua",
    "https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/WoldanHackFTF.lua",
    "https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/WoldanAdmin.lua",
    "https://raw.githubusercontent.com/Woldan1337/drakplon1243/refs/heads/main/SpeedStrafe.lua"
}

-- URL'lerden script'leri indirme fonksiyonu
function loadScript(url)
    local response = game:HttpGet(url) -- Lua'da HTTP GET kullanımı
    loadstring(response)() -- Yüklediğimiz script'i çalıştırıyoruz
end

-- Script'leri teker teker yükle
for _, url in ipairs(urls) do
    loadScript(url)
end
