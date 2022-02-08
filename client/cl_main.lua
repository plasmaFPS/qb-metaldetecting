local QBCore = exports['qb-core']:GetCoreObject()
local ent
local pos
local animdict
local anim
local breakchance
local overheated = false
local reward = false

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
                TriggerServerEvent('qb-metaldetecting:detectreward')
                breakchance = math.random(1,100)
                if breakchance <= Config.OverheatChance then
                    overheated = true
                    QBCore.Functions.Notify('Your metal detector has overheated! Wait a minute.', 'error', 4000)
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


RegisterNetEvent('qb-metaldetector:tradingmenu', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Common Material Trade",
            txt = ""
        },
        {
            id = 2,
            header = "Trade 1",
            txt = "50 Metal Trash for 30 Metal scrap!",
            params = {
                event = "qb-metaldetector:Trade2",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Trade 2",
            txt = "50 Iron Trash for 30 Iron scrap!",
            params = {
                event = "qb-metaldetector:Trade3",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Trade 3",
            txt = "50 Bullet Casings for 25 copper + 25 Gunpowder!",
            params = {
                event = "qb-metaldetector:Trade4",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Trade 4",
            txt = "50 Aluminum Cans for 30 Aluminium scrap!",
            params = {
                event = "qb-metaldetector:Trade5",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 6,
            header = "Trade 5",
            txt = "50 Steel Trash for 25 steel scrap!",
            params = {
                event = "qb-metaldetector:Trade6",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 7,
            header = "Trade 6",
            txt = "5 Rusty knifes for a Dagger!",
            params = {
                event = "qb-metaldetector:Trade7",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 8,
            header = "Trade 7",
            txt = "4 broken Metal Detectors for $200!",
            params = {
                event = "qb-metaldetector:Trade8",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 8,
            header = "Trade 7",
            txt = "50 housekeys for 30 copper!",
            params = {
                event = "qb-metaldetector:Trade8",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
          id = 9,
          header = "Trade 8",
          txt = "5 Broken phones for $50 + 1 phone!",
          params = {
              event = "qb-metaldetector:Trade9",
              args = {
                  number = 1,
                  id = 6
              }
          }
      },
    })
end)


RegisterNetEvent('qb-metaldetector:Raretradingmenu', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Rare Material Trade",
            txt = ""
        },
        {
            id = 2,
            header = "Burried Treasure",
            txt = "Trade 1 Burried Treasure for $15,000!",
            params = {
                event = "qb-metaldetector:client:burriedtreasure",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Treasure Key",
            txt = "Trade 1 Burried Treasure for $1,500!",
            params = {
                event = "qb-metaldetector:client:treasurekey",
                args = {
                    number = 1,
                    id = 3
                }
            }
        },
        {
            id = 4,
            header = "Trade 3",
            txt = "1 Antique coin for $1000!",
            params = {
                event = "qb-metaldetector:Trade4",
                args = {
                    number = 1,
                    id = 4
                }
            }
        },
        {
            id = 5,
            header = "Trade 4",
            txt = "1 Golden Nuggets $200!",
            params = {
                event = "qb-metaldetector:Trade5",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 6,
            header = "Trade 5",
            txt = "1 Gold Coin for $300!",
            params = {
                event = "qb-metaldetector:Trade6",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 7,
            header = "Trade 6",
            txt = "Aicient Coin for $500!",
            params = {
                event = "qb-metaldetector:Trade7",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 8,
            header = "Trade 7",
            txt = "WW2 Relic for $800!",
            params = {
                event = "qb-metaldetector:Trade8",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
            id = 8,
            header = "Broken Gameboys",
            txt = "Trade 10 Broken Gameboys for 1 working Gameboy!",
            params = {
                event = "qb-metaldetector:client:brokengameboy",
                args = {
                    number = 1,
                    id = 5
                }
            }
        },
        {
          id = 9,
          header = "Trade 8",
          txt = "1 Pocket watch for $150!",
          params = {
              event = "qb-metaldetector:Trade9",
              args = {
                  number = 1,
                  id = 6
              }
          }
      },
    })
end)


RegisterNetEvent('qb-metaldetector:client:burriedtreasure', function(cb)
    local item = 'burriedtreasure'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:burriedtreasure', cb)
        else
            QBCore.Functions.Notify('You do not have burried treasure.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:treasurekey', function(cb)
    local item = 'treasurekey'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:treasurekey', cb)
        else
            QBCore.Functions.Notify('You do not have a Treasure Key.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:antcoin', function(cb)
    local item = 'antiquecoin'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:antcoin', cb)
        else
            QBCore.Functions.Notify('You do not have an Antique Coin', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:goldnug', function(cb)
    local item = 'goldennugget'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:goldnug', cb)
        else
            QBCore.Functions.Notify('You do not have a Golden Nugget.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:goldcoin', function(cb)
    local item = 'goldcoin'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:goldcoin', cb)
        else
            QBCore.Functions.Notify('You do not have a Gold Coin.', 'error', 5000)
        end
    end, item)
    
end)


RegisterNetEvent('qb-metaldetector:client:ancientcoin', function(cb)
    local item = 'ancientcoin'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:ancientcoin', cb)
        else
            QBCore.Functions.Notify('You do not have an Ancient Coin.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:ww2relic', function(cb)
    local item = 'ww2relic'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:ww2relic', cb)
        else
            QBCore.Functions.Notify('You do not have a WW2 Relic.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:brokengameboy', function(cb)
    local item = 'brokengameboy'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:brokengameboy', cb)
        else
            QBCore.Functions.Notify('You do not have Broken Gameboys.', 'error', 5000)
        end
    end, item)
    
end)

RegisterNetEvent('qb-metaldetector:client:pocketwatch', function(cb)
    local item = 'pocketwatch'
    local cb = false

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            cb = true
            TriggerServerEvent('qb-metaldetector:server:pocketwatch', cb)
        else
            QBCore.Functions.Notify('You do not have a Pocketwatch.', 'error', 5000)
        end
    end, item)
    
end)
