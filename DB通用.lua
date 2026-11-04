local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("DB_UpdateNotice")
if old then old:Destroy() end

local CLR = Color3.fromRGB(0, 0, 0)
local TXT = Color3.fromRGB(212, 255, 0)
local SUB = Color3.fromRGB(57, 255, 20)

local function strokeFor(p,t,tr)
    local s = Instance.new("UIStroke")
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Color = TXT; s.Thickness = t or 1.5; s.Transparency = tr or 0.2; s.Parent = p
    return s
end

local gui = Instance.new("ScreenGui")
gui.Name = "DB_UpdateNotice"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 2000
gui.Parent = pg

local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.Size = UDim2.fromOffset(280, 220)
frame.BackgroundColor3 = CLR
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Parent = gui
strokeFor(frame, 1.5, 0.1)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.Position = UDim2.fromOffset(0, 12)
title.BackgroundTransparency = 1
title.Text = "脚本已更新Git HUB上已删"
title.TextColor3 = TXT
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.Parent = frame

local line2 = Instance.new("TextLabel")
line2.Size = UDim2.new(1, 0, 0, 20)
line2.Position = UDim2.fromOffset(0, 48)
line2.BackgroundTransparency = 1
line2.Text = "请进QQ群"
line2.TextColor3 = TXT
line2.TextSize = 12
line2.Font = Enum.Font.GothamBold
line2.Parent = frame

local qqNumber = Instance.new("TextLabel")
qqNumber.Size = UDim2.new(1, 0, 0, 26)
qqNumber.Position = UDim2.fromOffset(0, 68)
qqNumber.BackgroundTransparency = 1
qqNumber.Text = "1080905080"
qqNumber.TextColor3 = SUB
qqNumber.TextSize = 20
qqNumber.Font = Enum.Font.GothamBold
qqNumber.Parent = frame

local copyQQBtn = Instance.new("TextButton")
copyQQBtn.AnchorPoint = Vector2.new(0, 0)
copyQQBtn.Position = UDim2.fromOffset(30, 110)
copyQQBtn.Size = UDim2.fromOffset(100, 34)
copyQQBtn.BackgroundColor3 = CLR
copyQQBtn.BackgroundTransparency = 0.3
copyQQBtn.BorderSizePixel = 0
copyQQBtn.AutoButtonColor = false
copyQQBtn.Text = "复制群聊"
copyQQBtn.TextColor3 = TXT
copyQQBtn.TextSize = 12
copyQQBtn.Font = Enum.Font.GothamBold
copyQQBtn.Parent = frame
strokeFor(copyQQBtn, 1, 0.4)

local copyCodeBtn = Instance.new("TextButton")
copyCodeBtn.AnchorPoint = Vector2.new(1, 0)
copyCodeBtn.Position = UDim2.new(1, -30, 0, 110)
copyCodeBtn.Size = UDim2.fromOffset(100, 34)
copyCodeBtn.BackgroundColor3 = CLR
copyCodeBtn.BackgroundTransparency = 0.3
copyCodeBtn.BorderSizePixel = 0
copyCodeBtn.AutoButtonColor = false
copyCodeBtn.Text = "获得最新代码"
copyCodeBtn.TextColor3 = TXT
copyCodeBtn.TextSize = 12
copyCodeBtn.Font = Enum.Font.GothamBold
copyCodeBtn.Parent = frame
strokeFor(copyCodeBtn, 1, 0.4)

local hint = Instance.new("TextLabel")
hint.Size = UDim2.new(1, 0, 0, 20)
hint.Position = UDim2.new(0, 0, 1, -50)
hint.BackgroundTransparency = 1
hint.Text = ""
hint.TextColor3 = SUB
hint.TextSize = 11
hint.Font = Enum.Font.GothamBold
hint.Parent = frame

local function flashBtn(btn, text)
    local oldText = btn.Text
    btn.Text = text
    btn.TextColor3 = CLR
    btn.BackgroundColor3 = SUB
    btn.BackgroundTransparency = 0.1
    task.delay(0.8, function()
        if btn and btn.Parent then
            btn.Text = oldText
            btn.TextColor3 = TXT
            btn.BackgroundColor3 = CLR
            btn.BackgroundTransparency = 0.3
        end
    end)
end

copyQQBtn.Activated:Connect(function()
    if setclipboard then
        pcall(function() setclipboard("1080905080") end)
        flashBtn(copyQQBtn, "已复制")
        hint.Text = "群号已复制到剪贴板"
    else
        hint.Text = "当前环境不支持剪贴板"
    end
end)

copyCodeBtn.Activated:Connect(function()
    if setclipboard then
        pcall(function() setclipboard([[loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d7d293c021b4b8859d89f773acb40548.lua"))()]]) end)
        flashBtn(copyCodeBtn, "已复制")
        hint.Text = "最新代码已复制到剪贴板"
    else
        hint.Text = "当前环境不支持剪贴板"
    end
end)