local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = 'mp_m_forgery_01',
        coords = vector4(-1158.44, -1986.14, 13.16, 322.02), 
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-metaldetector:tradingmenu",
                    icon = "fas fa-user-secret",
                    label = "Trade your Finds"
                }
            },
          distance = 2.5,
        },
    })
    
    exports['qb-target']:SpawnPed({
        model = 'mp_m_weapexp_01', 
        coords = vector4(-2085.17, -1017.98, 12.78, 74.19),
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-metaldetector:Raretradingmenu",
                    icon = "fas fa-user-secret",
                    label = "Trade your Rare Finds"
                }
            },
            distance = 2.5,
        },
    })
end)
