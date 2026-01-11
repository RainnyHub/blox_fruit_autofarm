-- โหลดไฟล์ Config และ Functions (เปลี่ยน URL เป็นลิงก์ GitHub ของคุณ)
-- loadstring(game:HttpGet("URL_TO_CONFIG"))()
-- loadstring(game:HttpGet("URL_TO_FUNCTIONS"))()

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

-- [[ Loops ทั้งหมด ]]
-- 1. Anti-AFK & Buso (ใส่โค้ดเดิมได้เลย)
-- 2. Auto Farm Loop (ใช้ฟังก์ชันที่โหลดมาจากไฟล์ Functions)
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
