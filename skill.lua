local p = game.Players.LocalPlayer
local g = p:WaitForChild("PlayerGui")
if g:FindFirstChild("SP") then g.SP:Destroy() end

local s = {
{"docx","Word"},{"ffmpeg","Video"},{"pdf","PDF"},{"pptx","Slide"},
{"xlsx","Excel"},{"skill-creator","Tạo skill"},{"image-gen-edit","Ảnh AI"},
{"finance","Tài chính"},{"imagemagick","Ảnh"},{"mcp","MCP"},
{"memory-edit","Memory"},{"tasks","Task"},{"skill-installer","Cài skill"},{"color","Màu"}
}

local sg = Instance.new("ScreenGui", g)
sg.Name = "SP"
sg.ResetOnSpawn = false

local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 300, 0, 380)
f.Position = UDim2.new(0.5, -150, 0.5, -190)
f.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)

local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1, 0, 0, 36)
t.BackgroundTransparency = 1
t.Text = "🎯 SKILL PICKER"
t.TextColor3 = Color3.new(1, 1, 1)
t.Font = Enum.Font.GothamBold
t.TextSize = 16

local sf = Instance.new("ScrollingFrame", f)
sf.Size = UDim2.new(1, -16, 1, -90)
sf.Position = UDim2.new(0, 8, 0, 40)
sf.BackgroundTransparency = 1
sf.ScrollBarThickness = 3
sf.CanvasSize = UDim2.new(0, 0, 0, #s * 40)

local l = Instance.new("UIListLayout", sf)
l.Padding = UDim.new(0, 5)

local function n(m)
    game.StarterGui:SetCore("SendNotification", {Title = "Skill Picker", Text = m, Duration = 3})
end

for _, v in ipairs(s) do
    local b = Instance.new("TextButton", sf)
    b.Size = UDim2.new(1, 0, 0, 34)
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b.Text = v[1] .. " | " .. v[2]
    b.TextColor3 = Color3.fromRGB(230, 230, 230)
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(function()
        n("Đã chọn: " .. v[1])
        print("✅ " .. v[1])
    end)
end

local r = Instance.new("TextButton", f)
r.Size = UDim2.new(0.47, 0, 0, 34)
r.Position = UDim2.new(0.02, 0, 1, -42)
r.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
r.Text = "🎲 Random"
r.TextColor3 = Color3.new(1, 1, 1)
r.Font = Enum.Font.GothamBold
r.TextSize = 13
Instance.new("UICorner", r).CornerRadius = UDim.new(0, 6)
r.MouseButton1Click:Connect(function()
    local x = s[math.random(#s)]
    n("Random: " .. x[1])
    print("✅ " .. x[1])
end)

local c = Instance.new("TextButton", f)
c.Size = UDim2.new(0.47, 0, 0, 34)
c.Position = UDim2.new(0.51, 0, 1, -42)
c.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
c.Text = "Đóng"
c.TextColor3 = Color3.new(1, 1, 1)
c.Font = Enum.Font.GothamBold
c.TextSize = 13
Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
c.MouseButton1Click:Connect(function()
    sg:Destroy()
end)
