-- Hız arttırma ve strafe yapma scripti
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local uis = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera
local speed = 45
local speedEnabled = false

-- Hızı açıp kapatma fonksiyonu
local function toggleSpeed()
    speedEnabled = not speedEnabled
    
    if speedEnabled then
        humanoid.WalkSpeed = speed
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Speed On", Text = "WalkSpeed set to " .. speed})
    else
        humanoid.WalkSpeed = 16  -- Varsayılan hız
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Speed Off", Text = "WalkSpeed reset to default"})
    end
end

-- Hızı sürekli kontrol et
game:GetService("RunService").Heartbeat:Connect(function()
    if speedEnabled and humanoid.WalkSpeed ~= speed then
        humanoid.WalkSpeed = speed
    end
end)

-- Strafe'ı kontrol et
local function onInput(input, gameProcessedEvent)
    if gameProcessedEvent or not speedEnabled then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        local moveDirection = Vector3.zero
        if uis:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if uis:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if uis:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if uis:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end

        humanoid:Move(Vector3.new(moveDirection.X, 0, moveDirection.Z)) -- Strafe hareketi
    end
end

-- Tuş girişlerini dinle
uis.InputBegan:Connect(onInput)

-- Toggle için Backspace tuşu
uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Backspace then  -- Backspace tuşu
        toggleSpeed()
    end
end)

-- Artık Backspace tuşu ile hız ve strafe açılıp kapatılabilir! 🚀
