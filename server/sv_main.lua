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
    elseif chance >= Config.RareChance then 
        local item = Config.RareItems[math.random(1, #Config.RareItems)]
        local amount = Config.RareAmount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, 'You found '.. item ..'!', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing..', 'error')
    end 
end)


RegisterNetEvent('qb-metaldetector:server:burriedtreasure', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'burriedtreasure'
    local cashamount = 15000
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:treasurekey', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'treasurekey'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:antcoin', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'antiquecoin'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:goldnug', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'goldennugget'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:goldcoin', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'goldcoin'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:ancientcoin', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'ancientcoin'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:ww2relic', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'ww2relic'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:brokengameboy', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'brokengameboy'
    local cashamount = 1500
    local gamebamount = 10
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('phone', 1)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved a working gameboy!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough Gameboys..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:pocketwatch', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'pocketwatch'
    local cashamount = 1500
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)