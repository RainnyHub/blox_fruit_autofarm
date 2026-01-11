-- [[ Global Variables ]]
getgenv().CurrentTween = nil 

-- [[ Function: Get Weapons ]]
getgenv().GetWeaponsList = function()
    local WeaponList = {}
    local Player = game.Players.LocalPlayer
    local function Check(Folder)
        for _, v in pairs(Folder:GetChildren()) do
            if v:IsA("Tool") then table.insert(WeaponList, v.Name) end
        end
    end
    Check(Player.Backpack)
    if Player.Character then Check(Player.Character) end
    return #WeaponList > 0 and WeaponList or {"No Weapon Found"}
end

-- [[ Smooth Tween Function ]]
getgenv().SmoothTween = function(targetCFrame)
    local Character = game.Players.LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local Root = Character.HumanoidRootPart
    if not _G.AutoFarm and not _G.AutoFruit then return end

    local Distance = (Root.Position - targetCFrame.Position).Magnitude
    if Distance < 5 then return end 

    local BV = Root:FindFirstChild("RainnyBV") or Instance.new("BodyVelocity", Root)
    BV.Name = "RainnyBV"
    BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    BV.Velocity = Vector3.new(0, 0, 0)

    if getgenv().CurrentTween then getgenv().CurrentTween:Cancel() end
    getgenv().CurrentTween = game:GetService("TweenService"):Create(Root, TweenInfo.new(Distance/_G.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
    getgenv().CurrentTween:Play()
    
    repeat task.wait() until not getgenv().CurrentTween or getgenv().CurrentTween.PlaybackState == Enum.PlaybackState.Completed or (Root.Position - targetCFrame.Position).Magnitude < 5
    if Root:FindFirstChild("RainnyBV") then Root.RainnyBV:Destroy() end
end

-- [[ Get Current Quest Info ]]
getgenv().GetQuestInfo = function()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    local Target = getgenv().QuestData[1]
    for _, v in pairs(getgenv().QuestData) do
        if MyLevel >= v.Level then Target = v end
    end
    return Target
end
