local FleeTheFacilityGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local HackingFailToggle = Instance.new("TextButton")

FleeTheFacilityGUI.Name = "FleeTheFacilityGUI"
FleeTheFacilityGUI.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = FleeTheFacilityGUI
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.800000012, 0, 0.75, 0)
MainFrame.Size = UDim2.new(0.200000003, 0, 0.25, 0)

HackingFailToggle.Name = "HackingFailToggle"
HackingFailToggle.Parent = MainFrame
HackingFailToggle.BackgroundColor3 = Color3.new(0, 0, 0)
HackingFailToggle.BorderColor3 = Color3.new(1, 1, 1)
HackingFailToggle.BorderSizePixel = 2
HackingFailToggle.Position = UDim2.new(0.0500000007, 0, 0.850000024, 0)
HackingFailToggle.Size = UDim2.new(0.899999976, 0, 0.0799999982, 0)
HackingFailToggle.Font = Enum.Font.SourceSansBold
HackingFailToggle.FontSize = Enum.FontSize.Size24
HackingFailToggle.Text = "Never fail hacking: OFF"
HackingFailToggle.TextColor3 = Color3.new(1, 0, 0)
HackingFailToggle.TextScaled = true
HackingFailToggle.TextSize = 24
HackingFailToggle.TextWrapped = true

neverfailhack = false

HackingFailToggle.MouseButton1Down:connect(function()
if neverfailhack == false then
neverfailhack = true
HackingFailToggle.Text = "Never fail hacking: ON"
HackingFailToggle.TextColor3 = Color3.fromRGB(0,255,0)
else
neverfailhack = false
HackingFailToggle.Text = "Never fail hacking: OFF"
HackingFailToggle.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

spawn (function()
while true do
wait()
if neverfailhack == true then
game.ReplicatedStorage.RemoteEvent:FireServer("SetPlayerMinigameResult",true)
end
end
end)
