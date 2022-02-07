Config = {}

-- ALL CHANCES ARE IN %

Config.DebugPoly = true

Config.DetectTime = math.random(2000,3000)

Config.CommonChance = 100
Config.UnCommonChance = 100
Config.RareChance = 100

Config.CommonAmount = math.random(2,5)
Config.UnCommonAmount = 1
Config.RareAmount = 1

Config.OverheatChance = 10
Config.OverheatTime = math.random(2000, 5000)

Config.CommonItems = {
    'metalscrap',
    'copper',
    'iron',
    'aluminum',
    'steel',
}

Config.UnCommonItems = {
    'harness',
    'weapon_golfclub',
}

Config.RareItems = {
    'pisto_ammo',
    'weapon_pistol',
    'goldchain',
}

-- PolyZones
Config.DetectZones = {
    [1] = {
        label = "PierBeach",
        zones = {
            vector2(-1792.4517822266, -739.05523681641),
            vector2(-1806.6379394531, -753.38067626953),
            vector2(-1822.2058105469, -737.79937744141),
            vector2(-1809.42578125, -723.16918945312)
        },
    },
    [2] = {
        label = "PierBeach2",
        zones = {
            vector2(-1788.5096435547, -762.63836669922),
            vector2(-1774.4842529297, -778.74298095703),
            vector2(-1763.3736572266, -768.83239746094),
            vector2(-1773.6209716797, -751.66754150391)
        },
    },
    [3] = {
        label = "PierBeach3",
        zones = {
            vector2(-1751.3582763672, -785.33258056641),
            vector2(-1737.2322998047, -803.93133544922),
            vector2(-1747.4965820312, -816.08984375),
            vector2(-1765.099609375, -800.02825927734)
        },
    },
}
