local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Blox Fruits",
    Icon = "rbxassetid://10723343321", 
    Author = "Rainny Hub💫",
    Folder = "RainnyHubConfig"
})

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

-- [[ Main Config ]]
_G.AutoFarm = false
_G.WeaponName = "Combat" 
_G.TweenSpeed = 200 
_G.AutoFruit = false 

-- [[ Global Variables ]]
local CurrentTween = nil 

-- [[ Stats Config ]]
_G.AutoStats = false
_G.SelectedStats = {
    ["Melee"] = false,
    ["Defense"] = false,
    ["Sword"] = false,
    ["Gun"] = false,
    ["Demon Fruit"] = false
}

-- [[ Function: ค้นหารายชื่ออาวุธที่มี ]]
local function GetWeaponsList()
    local WeaponList = {}
    local Player = game.Players.LocalPlayer
    
    for _, v in pairs(Player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end
    if Player.Character then
        for _, v in pairs(Player.Character:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(WeaponList, v.Name)
            end
        end
    end
    if #WeaponList == 0 then
        table.insert(WeaponList, "No Weapon Found")
    end
    return WeaponList
end

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

-- Tabs
local MainTab = Window:Tab({ Title = "Auto Farm", Icon = "house" })
local StatsTab = Window:Tab({ Title = "Stats", Icon = "chart-no-axes-column-increasing" })
local WorldTab = Window:Tab({ Title = "World", Icon = "map" })
local FruitTab = Window:Tab({ Title = "Fruit", Icon = "apple" })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "apple" })

-- [[ UI: Auto Farm ]]
MainTab:Toggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value 
        if not Value then
            if CurrentTween then CurrentTween:Cancel() CurrentTween = nil end
            pcall(function()
                local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
                if Root:FindFirstChild("RainnyBV") then
                    Root.RainnyBV:Destroy()
                end
                Root.Velocity = Vector3.new(0,0,0)
            end)
        end
    end
})

local WeaponDropdown = MainTab:Dropdown({
    Title = "Select Your Weapon",
    Multi = false,
    Values = GetWeaponsList(),
    Default = _G.WeaponName,
    Callback = function(Value)
        _G.WeaponName = Value
    end
})

MainTab:Button({
    Title = "Refresh Weapons List",
    Callback = function()
        WeaponDropdown:SetValues(GetWeaponsList())
    end
})

-- [[ UI: Stats ]]
StatsTab:Toggle({
    Title = "Enable automatic status update",
    Default = false,
    Callback = function(Value)
        _G.AutoStats = Value
    end
})

StatsTab:Section({ Title = "Select the status you want to up." })

StatsTab:Toggle({ Title = "Melee", Default = false, Callback = function(v) _G.SelectedStats["Melee"] = v end })
StatsTab:Toggle({ Title = "Defense", Default = false, Callback = function(v) _G.SelectedStats["Defense"] = v end })
StatsTab:Toggle({ Title = "Sword", Default = false, Callback = function(v) _G.SelectedStats["Sword"] = v end })
StatsTab:Toggle({ Title = "Gun", Default = false, Callback = function(v) _G.SelectedStats["Gun"] = v end })
StatsTab:Toggle({ Title = "Demon Fruit", Default = false, Callback = function(v) _G.SelectedStats["Demon Fruit"] = v end })

-- [[ UI: World ]]
WorldTab:Button({ Title = "Teleport to Sea 1", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end })
WorldTab:Button({ Title = "Teleport to Sea 2", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end })
WorldTab:Button({ Title = "Teleport to Sea 3", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end })

-- [[ UI: Fruit ]]
FruitTab:Button({
    Title = "Random Fruit",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end
})

FruitTab:Toggle({
    Title = "Auto Bring Fruits (บินหาผล)",
    Default = false,
    Callback = function(Value)
        _G.AutoFruit = Value
        if not Value then
            if CurrentTween then CurrentTween:Cancel() CurrentTween = nil end
            pcall(function()
                local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
                if Root:FindFirstChild("RainnyBV") then
                    Root.RainnyBV:Destroy()
                end
                Root.Velocity = Vector3.new(0,0,0)
            end)
        end
    end
})

-- [[ Data - Quest Info ]]
local QuestData = {
    {Level = 0, QName = "BanditQuest1", Monster = "Bandit", ID = 1, Pos = CFrame.new(1059.3, 16.5, 1546.1), Spawn = CFrame.new(1145, 16, 1634)},
    {Level = 10, QName = "JungleQuest", Monster = "Monkey", ID = 1, Pos = CFrame.new(-1601.1, 36.8, 153.1), Spawn = CFrame.new(-1623, 36, 151)},
    {Level = 15, QName = "JungleQuest", Monster = "Gorilla", ID = 2, Pos = CFrame.new(-1601.1, 36.8, 153.1), Spawn = CFrame.new(-1242, 6, -493)},
    {Level = 30, QName = "BuggyQuest1", Monster = "Pirate", ID = 1, Pos = CFrame.new(-1141, 4.7, 3828), Spawn = CFrame.new(-1217, 4, 3912)},
    {Level = 60, QName = "DesertQuest", Monster = "Desert Bandit", ID = 1, Pos = CFrame.new(896, 6.4, 4390), Spawn = CFrame.new(996, 6, 4425)},
    {Level = 90, QName = "SnowQuest", Monster = "Snow Bandit", ID = 1, Pos = CFrame.new(1384.4, 87.2, -1295.1), Spawn = CFrame.new(1304, 87, -1314)},
    {Level = 120, QName = "MarineQuest2", Monster = "Chief Petty Officer", ID = 1, Pos = CFrame.new(-5036.8, 28.6, 4323.6), Spawn = CFrame.new(-4849, 22, 4339)},
    {Level = 150, QName = "SkyQuest", Monster = "Sky Bandit", ID = 1, Pos = CFrame.new(-4842, 718, -2620), Spawn = CFrame.new(-4968, 720, -2604)},
    {Level = 190, QName = "PrisonerQuest", Monster = "Prisoner", ID = 1, Pos = CFrame.new(5310.6, -1.8, 474.9), Spawn = CFrame.new(5403, 15, 508)},
    {Level = 250, QName = "ColosseumQuest", Monster = "Toga Warrior", ID = 1, Pos = CFrame.new(-1575, 7, -2982), Spawn = CFrame.new(-1832, 7, -2863)},
    {Level = 300, QName = "MagmaQuest", Monster = "Military Soldier", ID = 1, Pos = CFrame.new(-5313, 12, 8515), Spawn = CFrame.new(-5395, 11, 8527)},
    {Level = 375, QName = "FishmanQuest", Monster = "Fishman Warrior", ID = 1, Pos = CFrame.new(61122, 18, 1567), Spawn = CFrame.new(61008, 18, 1475)},
    {Level = 450, QName = "SkyExp1Quest", Monster = "God's Guard", ID = 1, Pos = CFrame.new(-4722, 845, -1950), Spawn = CFrame.new(-4670, 848, -1949)},
    {Level = 625, QName = "FountainQuest", Monster = "Galley Pirate", ID = 1, Pos = CFrame.new(5259.81982, 37.3500061, 4050.02905), Spawn = CFrame.new(5538, 38, 3995)},
    {Level = 700, QName = "Area1Quest", Monster = "Raider", ID = 1, Pos = CFrame.new(-424, 73, 1836), Spawn = CFrame.new(-747, 73, 2397)},
    {Level = 775, QName = "Area2Quest", Monster = "Swan Pirate", ID = 1, Pos = CFrame.new(634, 73, 918), Spawn = CFrame.new(874, 121, 1201)},
    {Level = 875, QName = "MarineQuest3", Monster = "Marine Lieutenant", ID = 1, Pos = CFrame.new(-2440, 73, -3211), Spawn = CFrame.new(-2342, 73, -3175)},
    {Level = 950, QName = "ZombieQuest", Monster = "Zombie", ID = 1, Pos = CFrame.new(-5497.06201, 47.5919952, -795.237), Spawn = CFrame.new(-5700, 48, -725)},
    {Level = 1000, QName = "SnowMountainQuest", Monster = "Snow Trooper", ID = 1, Pos = CFrame.new(609, 401, -5372), Spawn = CFrame.new(477, 401, -5329)},
    {Level = 1100, QName = "IceSideQuest", Monster = "Lab Subordinate", ID = 1, Pos = CFrame.new(-6231.27197, 80.9337692, -4851.3208), Spawn = CFrame.new(-6006.71143, 89.9096222, -4398.32959, 0.824622214, -1.37347547e-08, -0.565683842, 4.46781669e-08, 1, 4.08494181e-08, 0.565683842, -5.89590528e-08, 0.824622214)},
    {Level = 1250, QName = "ShipQuest1", Monster = "Ship Deckhand", ID = 1, Pos = CFrame.new(1038.37024, 125.078751, 32909.1758, 0.0364378728, -6.61304895e-08, -0.999335945, 4.587557e-08, 1, -6.45017195e-08, 0.999335945, -4.34948007e-08, 0.0364378728), Spawn = CFrame.new(1187.48596, 125.750481, 32988.6094, -0.0136230439, -3.89175447e-09, -0.999907196, -9.69806369e-09, 1, -3.75998654e-09, 0.999907196, 9.64594182e-09, -0.0136230439)},
    {Level = 1350, QName = "FrostQuest", Monster = "Arctic Warrior", ID = 1, Pos = CFrame.new(5667.6582, 26.8000031, -6486.08984, -0.749106407, 0, 0.662450135, 0, 1, 0, -0.662450135, 0, -0.749106407), Spawn = CFrame.new(5985.98682, 28.3882389, -6221.63135, 0.987439215, 3.40292452e-08, -0.157999307, -3.05721244e-08, 1, 2.43110492e-08, 0.157999307, -1.91753085e-08, 0.987439215)},
    {Level = 1425, QName = "ForgottenQuest", Monster = "Water Fighter", ID = 2, Pos = CFrame.new(-3054.44507, 238.343994, -10142.8193, 0.785005927, 0, 0.61948818, 0, 1, 0, -0.61948818, 0, 0.785005927), Spawn = CFrame.new(-3497.23071, 238.868301, -10532.1133, 0.225351781, 8.95789896e-08, -0.974277437, 1.12330989e-08, 1, 9.45422585e-08, 0.974277437, -3.22494209e-08, 0.225351781)},
    {Level = 1500, QName = "PiratePortQuest", Monster = "Pirate Millionaire", ID = 1, Pos = CFrame.new(-450.105011, 107.681, 5950.72607, 0.438713968, 0, 0.898626804, 0, 1, 0, -0.898626804, 0, 0.438713968), Spawn = CFrame.new(-665.587952, 57.0017586, 5651.23047, -0.0707179904, 4.74246065e-08, -0.997496367, -2.70811995e-09, 1, 4.77356323e-08, 0.997496367, 6.07710771e-09, -0.0707179904)},
    {Level = 1575, QName = "PiratePortQuest", Monster = "Pistol Billionaire", ID = 2, Pos = CFrame.new(-450.105011, 107.681, 5950.72607, 0.438713968, 0, 0.898626804, 0, 1, 0, -0.898626804, 0, 0.438713968), Spawn = CFrame.new(-126.464424, 84.7995605, 6157.71045, -0.57560581, 4.42860637e-09, 0.817727327, 4.23190455e-10, 1, -5.11786169e-09, -0.817727327, -2.59981658e-09, -0.57560581)},
    {Level = 1700, QName = "HydraQuest", Monster = "Dragon Crew Warrior", ID = 1, Pos = CFrame.new(5456, 614, -2323), Spawn = CFrame.new(5683, 621, -2413)},
    {Level = 1800, QName = "TurtleQuest", Monster = "Fishman Raider", ID = 1, Pos = CFrame.new(-10582, 332, -8466), Spawn = CFrame.new(-10651, 332, -8364)},
    {Level = 1975, QName = "TurtleQuest", Monster = "Jungle Pirate", ID = 1, Pos = CFrame.new(-12106, 332, -10539), Spawn = CFrame.new(-12048, 332, -10453)},
    {Level = 2100, QName = "IceCreamIslandQuest", Monster = "Cookie Crafter", ID = 1, Pos = CFrame.new(-925, 66, -12322), Spawn = CFrame.new(-927, 66, -12117)},
    {Level = 2200, QName = "CakeQuest", Monster = "Baking Staff", ID = 1, Pos = CFrame.new(-1882, 70, -12111), Spawn = CFrame.new(-1839, 70, -12213)},
    {Level = 2300, QName = "HauntedQuest1", Monster = "Reborn Skeleton", ID = 1, Pos = CFrame.new(-9479, 141, 5566), Spawn = CFrame.new(-9618, 142, 5707)},
    {Level = 2400, QName = "CandyQuest", Monster = "Candy Pirate", ID = 1, Pos = CFrame.new(-1147, 13, -14120), Spawn = CFrame.new(-1261, 13, -14197)},
    {Level = 2500, QName = "TikiQuest", Monster = "Sun-kissed Warrior", ID = 1, Pos = CFrame.new(-16235, 12, 452), Spawn = CFrame.new(-16453, 13, 114)},
    {Level = 2650, QName = "TikiQuest", Monster = "Islander", ID = 2, Pos = CFrame.new(-16235, 12, 452), Spawn = CFrame.new(-16723, 13, -100)},
    {Level = 2800, QName = "TikiQuest", Monster = "Marine Forces", ID = 3, Pos = CFrame.new(-16235, 12, 452), Spawn = CFrame.new(-17208, 13, -260)}
}

-- [[ Smooth Tween Function ]]
local function SmoothTween(targetCFrame)
    local Character = game.Players.LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local Root = Character.HumanoidRootPart
    
    if not _G.AutoFarm and not _G.AutoFruit then return end

    local Distance = (Root.Position - targetCFrame.Position).Magnitude
    if Distance < 5 then return end 

    local BV = Root:FindFirstChild("RainnyBV") or Instance.new("BodyVelocity")
    BV.Name = "RainnyBV"
    BV.Parent = Root
    BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    BV.Velocity = Vector3.new(0, 0, 0)

    if CurrentTween then CurrentTween:Cancel() end
    CurrentTween = game:GetService("TweenService"):Create(Root, TweenInfo.new(Distance/_G.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
    CurrentTween:Play()
    
    repeat 
        task.wait() 
        if (not _G.AutoFarm and not _G.AutoFruit) or not Character:FindFirstChild("HumanoidRootPart") then 
            if CurrentTween then CurrentTween:Cancel() CurrentTween = nil end
            if Root:FindFirstChild("RainnyBV") then Root.RainnyBV:Destroy() end
            break 
        end
    until not CurrentTween or CurrentTween.PlaybackState == Enum.PlaybackState.Completed or (Root.Position - targetCFrame.Position).Magnitude < 5
    
    CurrentTween = nil -- Reset Tween Status
    if Root:FindFirstChild("RainnyBV") then Root.RainnyBV:Destroy() end
end

-- [[ Get Current Quest Info ]]
local function GetQuestInfo()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    local Target = QuestData[1]
    for _, v in pairs(QuestData) do
        if MyLevel >= v.Level then Target = v end
    end
    return Target
end

-- [[ Auto Stats Loop ]]
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoStats then
            pcall(function()
                local Points = game:GetService("Players").LocalPlayer.Data.Points.Value
                if Points > 0 then
                    for StatName, IsSelected in pairs(_G.SelectedStats) do
                        if IsSelected then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", StatName, 1)
                        end
                    end
                end
            end)
        end
    end
end)

-- [[ Auto Fruit Farm Loop ]]
task.spawn(function()
    while task.wait() do
        if _G.AutoFruit then
            pcall(function()
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") and v.Name:find("Fruit") then
                        SmoothTween(v.Handle.CFrame)
                    end
                end
            end)
        end
    end
end)

-- [[ Auto Farm Loop (Improved Quest Check & Search Logic) ]]
task.spawn(function()
    local searchAngle = 0
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                local Player = game.Players.LocalPlayer
                local Character = Player.Character
                if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
                
                local Info = GetQuestInfo()
                local QuestGui = Player.PlayerGui.Main.Quest
                
                if QuestGui.Visible then
                    local CurrentQuestName = QuestGui.Container.QuestTitle.Title.Text
                    if not CurrentQuestName:find(Info.Monster) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    else
                        -- ค้นหามอนสเตอร์
                        local Monster = nil
                        for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name:find(Info.Monster) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                Monster = v
                                break
                            end
                        end

                        if Monster and Monster:FindFirstChild("HumanoidRootPart") then
                            searchAngle = 0 -- รีเซ็ตมุมค้นหาเมื่อเจอมอน
                            local TargetPos = Monster.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            if (Character.HumanoidRootPart.Position - TargetPos.Position).Magnitude > 8 then
                                SmoothTween(TargetPos)
                            else
                                if CurrentTween then CurrentTween:Cancel() CurrentTween = nil end
                                Character.HumanoidRootPart.CFrame = TargetPos
                                
                                local Root = Character.HumanoidRootPart
                                local BV = Root:FindFirstChild("RainnyBV") or Instance.new("BodyVelocity")
                                BV.Name = "RainnyBV"
                                BV.Parent = Root
                                BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                                BV.Velocity = Vector3.new(0, 0, 0)
                            end

                            local Tool = Player.Backpack:FindFirstChild(_G.WeaponName) or Character:FindFirstChild(_G.WeaponName)
                            if Tool then Character.Humanoid:EquipTool(Tool) end
                        else
                            -- ไม่เจอมอน: Tween ค้นหารอบๆ รัศมี 200 เมตร
                            if Info.Spawn then
                                searchAngle = searchAngle + 45 -- เพิ่มมุมทีละ 45 องศาเพื่อให้เคลื่อนที่แบบ 8 ทิศทาง
                                if searchAngle >= 360 then searchAngle = 0 end
                                
                                local rad = math.rad(searchAngle)
                                local x = math.cos(rad) * 500
                                local z = math.sin(rad) * 500
                                local SearchPos = Info.Spawn * CFrame.new(x, 20, z)
                                
                                SmoothTween(SearchPos)
                            end
                        end
                    end
                else
                    SmoothTween(Info.Pos)
                    if (Character.HumanoidRootPart.Position - Info.Pos.Position).Magnitude < 15 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", Info.QName, Info.ID)
                    end
                end
            end)
        end
    end
end)

-- [[ Anti-Die & NoClip (Modified: On/Off during Tween) ]]
game:GetService("RunService").Stepped:Connect(function()
    if (_G.AutoFarm or _G.AutoFruit) and CurrentTween then
        local Character = game.Players.LocalPlayer.Character
        if Character then
            for _, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

-- [[ Fast Attack (Optimized) ]]
task.spawn(function()
    local net = game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
    local RegisterAttack = net:WaitForChild("RE/RegisterAttack")
    local RegisterHit = net:WaitForChild("RE/RegisterHit")

    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                local Character = game.Players.LocalPlayer.Character
                local Tool = Character:FindFirstChildOfClass("Tool")
                if Tool then
                    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                        local hrp = enemy:FindFirstChild("HumanoidRootPart")
                        if hrp and (Character.HumanoidRootPart.Position - hrp.Position).Magnitude < 60 then
                            RegisterAttack:FireServer(0)
                            RegisterHit:FireServer(hrp, {{enemy, hrp}})
                        end
                    end
                end
            end)
        end
    end
end)

WindUI:Notify({ Title = "Rainny Hub", Content = "Search System Applied (200m Radius)!", Duration = 5 })
