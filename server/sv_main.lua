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
    local cashamount = 10000
   
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
    local cashamount = 500
   
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
    local cashamount = 200
   
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
    local cashamount = 300
   
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
    local cashamount = 1000
   
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
    local cashamount = 800
   
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
            Player.Functions.AddItem('gameboy', 1)
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
    local cashamount = 150
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:metaltrash', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'metaltrash'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('metalscrap', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 Metal Scrap!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough Metal Scrap..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:irontrash', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'irontrash'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('ironscrap', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 Iron Scrap!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough iron trash..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:bullet', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'bulletcasings'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('copper', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 copper!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough bullet casings..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:cans', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'aluminumcan'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('Aluminum', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 Aluminum!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough Aluminum cans..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:steeltrash', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'steeltrash'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('steel', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 steel!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough steel trash..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:dagger', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'brokenknife'
    local cashamount = 1500
    local gamebamount = 5
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('weapon_dagger', 1)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 1 dagger!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough broken knifes..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:detector', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'brokendetector'
    local cashamount = 30
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:keys', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'housekeys'
    local cashamount = 1500
    local gamebamount = 50
    local check = Player.Functions.GetItemByName(item)

    if cb then 
        if check.amount >= gamebamount then
            Player.Functions.RemoveItem(item, gamebamount)
            Player.Functions.AddItem('copper', 30)
            TriggerClientEvent('QBCore:Notify', src, 'You traded '..gamebamount..' '..item.."'s"..' and recieved 30 copper!', 'success')
        else 
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough housekeys..", 'error')
        end 
    else 
        print('stinky modder')
    end
end)

RegisterNetEvent('qb-metaldetector:server:phone123', function(cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'brokenphone'
    local cashamount = 25
   
    if cb then 
        Player.Functions.RemoveItem(item, 1)
        Player.Functions.AddMoney('cash', cashamount)
        TriggerClientEvent('QBCore:Notify', src, 'You sold a '..item..' for $'..cashamount..'.', 'success')
    else 
        print('stinky modder')
    end
end)

