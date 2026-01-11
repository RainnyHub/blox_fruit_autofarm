-- โหลดไฟล์ Config และ Functions (เปลี่ยน URL เป็นลิงก์ GitHub ของคุณ)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RainnyHub/blox_fruit_autofarm/refs/heads/main/Config.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RainnyHub/blox_fruit_autofarm/refs/heads/main/Functions.lua"))()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Blox Fruits",
    Icon = "rbxassetid://10723343321", 
    Author = "Rainny Hub💫",
    Folder = "RainnyHubConfig"
})

-- [[ เรียกใช้งาน UI (ยกส่วน Window:EditOpenButton และ Tabs มาใส่ตรงนี้) ]]
-- (ตัวอย่างการเรียกใช้ฟังก์ชันข้ามไฟล์ใน Dropdown)
-- Values = GetWeaponsList(), 
Window:EditOpenButton({
    Title = "Rainny Hub",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("00D2FF"), 
        Color3.fromHex("9D50BB")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})
-- Tabs
local MainTab = Window:Tab({ Title = "Auto Farm", Icon = "house" })
local StatsTab = Window:Tab({ Title = "Stats", Icon = "chart-no-axes-column-increasing" })
local WorldTab = Window:Tab({ Title = "World", Icon = "map" })
local FruitTab = Window:Tab({ Title = "Fruit", Icon = "apple" })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "apple" })

-- [[ Loops ทั้งหมด ]]
-- 1. Anti-AFK & Buso (ใส่โค้ดเดิมได้เลย)
-- 2. Auto Farm Loop (ใช้ฟังก์ชันที่โหลดมาจากไฟล์ Functions)

-- [[ Anti-AFK System ]]
task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- [[ Auto Buso Haki System ]]
task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            local Player = game.Players.LocalPlayer
            if Player.Character and not Player.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                local Info = GetQuestInfo() -- เรียกใช้จากไฟล์ Functions
                -- โค้ด Logic การฟาร์มเดิม...
            end)
        end
    end
end)

-- 3. Auto Stats & Fruit Loop (ใส่โค้ดเดิมได้เลย)

WindUI:Notify({ Title = "Rainny Hub", Content = "Script Loaded Successfully!", Duration = 5 })
