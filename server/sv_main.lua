local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("metaldetector", function(src, item)
    TriggerClientEvent('qb-metaldetecting:startdetect', src)
end)

RegisterNetEvent('qb-metaldetecting:detectreward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)

    if chance <= Config.CommonChance then 
        local item = Config.CommonItems[math.random(1, #Config.CommonItems)]
        local amount = Config.CommonAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'You found '.. item ..'!', 'success')
    elseif chance <= Config.UnCommonChance then 
        local item = Config.UnCommonItems[math.random(1, #Config.UnCommonItems)]
        local amount = Config.UnCommonAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'You found '.. item ..'!', 'success')
    elseif chance <= Config.RareChance then 
        local item = Config.RareItems[math.random(1, #Config.RareItems)]
        local amount = Config.RareAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'You found '.. item ..'!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing..', 'error')
    end 
end)
