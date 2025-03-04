local player = game.Players.LocalPlayer

-- Her oyuncuya ESP ve Wallhack eklemek için bir fonksiyon
local function addFeatures(target)
    if target ~= player then
        local character = target.Character or target.CharacterAdded:Wait()

        -- Highlight ile çerçeve oluştur (ESP için)
        if not character:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight", character)
            highlight.Name = "ESP_Highlight"
            highlight.Adornee = character
            highlight.FillTransparency = 1 -- İçini tamamen şeffaf yap
            highlight.OutlineColor = Color3.new(0, 1, 0) -- Yeşil dış hat
            highlight.OutlineTransparency = 0
        end

        -- BillboardGui ile oyuncu ismini göstermek
        if not character:FindFirstChild("NameTag") then
            local head = character:WaitForChild("Head")
            local billboard = Instance.new("BillboardGui", head)
            billboard.Name = "NameTag"
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel", billboard)
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = target.Name
            textLabel.TextColor3 = Color3.new(1, 1, 1) -- Beyaz renk
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextScaled = true
        end

        -- Wallhack: Tüm vücut parçalarını duvar arkası görünür yap
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = 0 -- Duvarların arkasından görünür yap
            end
        end

        -- Karakter güncellendiğinde Wallhack yeniden uygula
        character.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = 0
            end
        end)
    end
end

-- Oyunda olan tüm oyunculara özellikler ekle
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= player then
        addFeatures(v)
    end
end

-- Yeni oyuncu eklendiğinde özellikler ekle
game.Players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Connect(function()
        addFeatures(newPlayer)
    end)
end)

-- Oyuncu ayrıldığında özellikleri kaldır
game.Players.PlayerRemoving:Connect(function(leavingPlayer)
    local character = leavingPlayer.Character
    if character then
        if character:FindFirstChild("Highlight") then
            character.Highlight:Destroy()
        end
        if character:FindFirstChild("NameTag") then
            character.NameTag:Destroy()
        end
    end
end)
