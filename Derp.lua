game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Derp Script Loaded", Text = "Derp script has been activated! Press:*"})
local player = game.Players.LocalPlayer
local derpEnabled = false  -- Başlangıçta kapalı

-- Derp scriptinin çalışmasını sağlayan fonksiyon
local function startDerp()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local head = character:WaitForChild("Head")

    while derpEnabled do
        -- Baş hareketini rastgele yap
        head.CFrame = head.CFrame * CFrame.Angles(0, math.random(-100, 100) * math.pi / 100, 0)
        wait(0.1)  -- 0.1 saniye bekle
    end
end

-- Toggle işlevi için input dinleyici
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Minus then  -- "-" tuşu
        derpEnabled = not derpEnabled
        
        if derpEnabled then
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Derp Activated", Text = "Derp movement is ON"})
            startDerp()
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Derp Deactivated", Text = "Derp movement is OFF"})
        end
    end
end)
