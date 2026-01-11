-- [[ Main Config ]]
_G.AutoFarm = false
_G.WeaponName = "Combat" 
_G.TweenSpeed = 200 
_G.AutoFruit = false 
_G.AutoStats = false
_G.SelectedStats = {
    ["Melee"] = false,
    ["Defense"] = false,
    ["Sword"] = false,
    ["Gun"] = false,
    ["Demon Fruit"] = false
}

-- [[ Quest Data ]]
getgenv().QuestData = {
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
