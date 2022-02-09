local QBCore = exports['qb-core']:GetCoreObject()
local ent
local pos
local animdict
local anim
local breakchance
local overheated = false

local boneoffsets = {
    ["w_am_digiscanner"] = {
        bone = 18905,
        offset = vector3(0.15, 0.1, 0.0),
        rotation = vector3(270.0, 90.0, 80.0),
    },
}

local function AttachEntity(ped, model)
    if boneoffsets[model] then
        QBCore.Functions.LoadModel(model)
        pos = GetEntityCoords(PlayerPedId())
        ent = CreateObjectNoOffset(model, pos, 1, 1, 0)
        AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, boneoffsets[model].bone), boneoffsets[model].offset, boneoffsets[model].rotation, 1, 1, 0, 0, 2, 1)
    end
end

RegisterNetEvent('qb-metaldetecting:startdetect', function(data)
    if inZone == 1 then 
        if not overheated then 
            QBCore.Functions.Progressbar('start_detect', 'Detecting...', Config.DetectTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            }, {
            animDict = 'mini@golfai',
            anim = 'wood_idle_a',
            flags = 49,
            }, {}, {}, function()
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, 'metaldetector', 0.2)
                Wait(2000)
                TriggerServerEvent('qb-metaldetecting:DetectReward')
                breakchance = math.random(1,100)
                if breakchance <= Config.OverheatChance then
                    overheated = true
                    QBCore.Functions.Notify('Your metal detector has overheated! Let it cool down.', 'error', 4000)
                    Wait(Config.OverheatTime)
                    overheated = false
                    QBCore.Functions.Notify('Your metal detector has cooled down.', 'primary', 4000)
                end
            end, function() 
                Wait(100)
            end)
        else 
            QBCore.Functions.Notify('Your metal detector is still too hot!', 'error', 5000)
        end 
    else 
        QBCore.Functions.Notify('You cannot detect here. Find a suitable location.', 'error', 5000)
    end
end)

CreateThread(function() 
    for k, v in pairs(Config.DetectZones) do
        local MetalZone = PolyZone:Create(v.zones, {
            name = v.label,
            debugPoly = Config.DebugPoly
        })
        
        MetalZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                inZone = 1
                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                    if HasItem then
                        AttachEntity(PlayerPedId(), "w_am_digiscanner")
                    end
                end, 'metaldetector') 
            else
                inZone = 0
                DetachEntity(ent, 0, 0)
                DeleteEntity(ent)
            end
        end)
    end
end)

-- Common Trade Menu --

RegisterNetEvent('qb-metaldetector:CommonTradingMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Common Material Trade",
            txt = ""
        },
        {
            id = 2,
            header = "Metal Trash",
            txt = "Trade 50 Metal Trash for 30 Metal Scrap!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 2,
                    item = 'metaltrash'
                }
            }
        },
        {
            id = 3,
            header = "Iron Trash",
            txt = "Trade 50 Iron Trash for 30 Iron",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 3,
                    item = 'irontrash'
                }
            }
        },
        {
            id = 4,
            header = "Bullet Casings",
            txt = "Trade 50 Bullet Casings for 30 Copper!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 4,
                    item = 'bulletcasings'
                }
            }
        },
        {
            id = 5,
            header = "Aluminum Cans",
            txt = "Trade 50 Aluminum Cans for 30 Aluminium",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 5,
                    item = 'aluminumcan'
                }
            }
        },
        {
            id = 6,
            header = "Steel Trash",
            txt = "Trade 50 Steel Trash for 25 Steel!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 6,
                    item = 'steeltrash'
                }
            }
        },
        {
            id = 7,
            header = "Broken Knives",
            txt = "Trade 5 Broken Knives for a Dagger!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 7,
                    item = 'brokenknife'
                }
            }
        },
        {
            id = 8,
            header = "Broken Metal Detectors",
            txt = "Trade 1 Broken Metal Detectors for $30!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 8,
                    item = 'brokendetector'
                }
            }
        },
        {
            id = 9,
            header = "House Keys",
            txt = "Trade 50 House Keys for 30 Copper!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:CommonTrade",
                args = {
                    id = 9,
                    item = 'housekeys'
                }
            }
        },
        {
        id = 10,
        header = "Broken Phones",
        txt = "Trade 1 Broken Phones for $25!",
        params = {
            isServer = true,
            event = "qb-metaldetector:server:CommonTrade",
            args = {
                id = 10,
                item = 'brokenphone'
                }
            }
        },
    })
end)

-- Rare Trade Menu -- 

RegisterNetEvent('qb-metaldetector:RareTradingMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Rare Material Trade",
            txt = ""
        },
        {
            id = 2,
            header = "Burried Treasure",
            txt = "Trade 1 Burried Treasure for $10,000!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 2,
                    item = 'burriedtreasure'
                }
            }
        },
        {
            id = 3,
            header = "Treasure Key",
            txt = "Trade 1 Treasure Key for $1,500!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 3,
                    item = 'treasurekey'
                }
            }
        },
        {
            id = 4,
            header = "Antique Coin",
            txt = "Trade 1 Antique Coin for $500!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 4,
                    item = 'antiquecoin'
                }
            }
        },
        {
            id = 5,
            header = "Golden Nuggets",
            txt = "Trade 1 Golden Nuggets $200!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 5,
                    item = 'goldennugget'
                }
            }
        },
        {
            id = 6,
            header = "Gold Coin",
            txt = "Trade 1 Gold Coin for $300!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 6,
                    item = 'goldcoin'
                }
            }
        },
        {
            id = 7,
            header = "Ancient Coin",
            txt = "Trade 1 Ancient Coin for $1000!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 7,
                    item = 'ancientcoin'
                }
            }
        },
        {
            id = 8,
            header = "WW2 Relic",
            txt = "Trade 1 WW2 Relic for $800!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 8,
                    item = 'ww2relic'
                }
            }
        },
        {
            id = 9,
            header = "Broken Gameboys",
            txt = "Trade 10 Broken Gameboys for 1 working Gameboy!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 9,
                    item = 'brokengameboy'
                }
            }
        },
        {
            id = 10,
            header = "Pocket Watch",
            txt = "Trade 1 Pocket watch for $150!",
            params = {
                isServer = true,
                event = "qb-metaldetector:server:RareTrade",
                args = {
                    id = 10,
                    item = 'pocketwatch'
                }
            }
        },
    })
end)
