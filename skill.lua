local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("SP") then
    PlayerGui.SP:Destroy()
end

local Skills = {
    {"docx", "Word"},
    {"ffmpeg", "Video"},
    {"pdf", "PDF"},
    {"pptx", "Slide"},
    {"xlsx", "Excel"},
    {"skill-creator", "Tạo skill"},
    {"image-gen-edit", "Ảnh AI"},
    {"finance", "Tài chính"},
    {"imagemagick", "Ảnh"},
    {"mcp", "MCP"},
    {"memory-edit", "Memory"},
    {"tasks", "Task"},
    {"skill-installer", "Cài skill"},
    {"color", "Màu"}
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SP"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 280, 0, 400)
Frame.Position = UDim2.new(0.5, -140, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "SKILL PICKER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Frame

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -16, 1, -100)
Scroll.Position = UDim2.new(0, 8, 0, 45)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 4
Scroll.CanvasSize = UDim2.new(0, 0, 0, #Skills * 42)
Scroll.Parent = Frame

local List = Instance.new("UIListLayout")
List.Padding = UDim.new(0, 6)
List.Parent = Scroll

local function Notify(msg)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Skill Picker",
            Text = msg,
            Duration = 3
        })
    end)
    print(msg)
end

for _, skill in ipairs(Skills) do
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 36)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Btn.Text = skill[1] .. "  |  " .. skill[2]
    Btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.AutoButtonColor = true
    Btn.Parent = Scroll

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        Notify("Đã chọn: " .. skill[1])
    end)
end

-- Nút Random
local RandomBtn = Instance.new("TextButton")
RandomBtn.Size = UDim2.new(0.46, 0, 0, 38)
RandomBtn.Position = UDim2.new(0.03, 0, 1, -48)
RandomBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
RandomBtn.Text = "Random"
RandomBtn.TextColor3 = Color3.new(1, 1, 1)
RandomBtn.Font = Enum.Font.GothamBold
RandomBtn.TextSize = 15
RandomBtn.Parent = Frame

Instance.new("UICorner", RandomBtn).CornerRadius = UDim.new(0, 8)

RandomBtn.MouseButton1Click:Connect(function()
    local pick = Skills[math.random(1, #Skills)]
    Notify("Random: " .. pick[1])
end)

-- Nút Đóng
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.46, 0, 0, 38)
CloseBtn.Position = UDim2.new(0.51, 0, 1, -48)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "Đóng"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 15
CloseBtn.Parent = Frame

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
