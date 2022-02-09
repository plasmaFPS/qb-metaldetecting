local QBCore = exports['qb-core']:GetCoreObject()

-- Create Usable Item -- 

QBCore.Functions.CreateUseableItem("metaldetector", function(src, item)
    TriggerClientEvent('qb-metaldetecting:startdetect', src)
end)

-- Detecting Reward --

RegisterNetEvent('qb-metaldetecting:DetectReward', function()
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

-- Common Trade Event --

RegisterServerEvent('qb-metaldetector:server:CommonTrade', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = tostring(data.item)
    local check = Player.Functions.GetItemByName(item)
    
    if data.id == 2 then
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('metalscrap', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 Metal Trash'..' for 30 Metal Scrap.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Metal Scrap..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Metal Trash.", 'error')
        end
    elseif data.id == 3 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('iron', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 Iron Trash'..' for 30 Iron.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Iron Scrap..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Iron Trash.", 'error')
        end
    elseif data.id == 4 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('copper', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 Bullet Casings'..' for 30 Bullet Casings.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Bullet Casings..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Bullet Casings.", 'error')
        end
    elseif data.id == 5 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('aluminum', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 Aluminum Cans'..' for 30 Aluminum.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Aluminum Cans..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Aluminum Cans.", 'error')
        end
    elseif data.id == 6 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('steel', 25)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 Steel Trash'..' for 25 Steel.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Steel Trash..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Steel Trash.", 'error')
        end
    elseif data.id == 7 then 
        if check ~= nil then
            if check.amount >= 5 then
                Player.Functions.RemoveItem(item, 5)
                Player.Functions.AddItem('weapon_dagger', 1)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 5 Broken Knives'..' for 1 Dagger.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Broken Knives..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Broken Knives.", 'error')
        end
    elseif data.id == 8 then 
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 broken Metal Detector'..' for $30.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Metal Detectors..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Metal Detectors.", 'error')
        end
    elseif data.id == 9 then 
        if check ~= nil then
            if check.amount >= 50 then
                Player.Functions.RemoveItem(item, 50)
                Player.Functions.AddItem('copper', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 50 House Keys'..' for 30 Copper.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough House Keys..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any House Keys.", 'error')
        end
    elseif data.id == 10 then 
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 30)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Broken Phone'..' for $30.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Broken Phones..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Broken Phones.", 'error')
        end
    end
end)

-- Rare Trade Event --

RegisterServerEvent('qb-metaldetector:server:RareTrade', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = tostring(data.item)
    local check = Player.Functions.GetItemByName(item)
    
    if data.id == 2 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 10000)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Burried Treasure'..' for $10,000.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Burried Treasure..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Burried Treasure.", 'error')
        end
    elseif data.id == 3 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 1500)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Treasure Key'..' for $1500.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Treasure Keys..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Treasure Keys.", 'error')
        end
    elseif data.id == 4 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 500)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Antique Coin'..' for $500.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Antique Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Antique Coins.", 'error')
        end
    elseif data.id == 5 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 200)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Golden Nugget'..' for $200.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Golden Nuggets..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Golden Nuggets.", 'error')
        end
    elseif data.id == 6 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 300)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Gold Coin'..' for $300.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Gold Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Gold Coins.", 'error')
        end
    elseif data.id == 7 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 1000)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Antique Coin'..' for $1000.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Antique Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Antique Coins.", 'error')
        end
    elseif data.id == 8 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 800)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 WW2 Coin'..' for $800.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough WW2 Coins..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any WW2 Coins.", 'error')
        end
    elseif data.id == 9 then
        if check ~= nil then
            if check.amount >= 10 then
                Player.Functions.RemoveItem(item, 10)
                TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items['gameboy'], 'add')
                Player.Functions.AddItem('gameboy', 1)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 10 Broken Gameboys'..' for 1 working Gameboy.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Broken Gameboys..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Broken Gameboys.", 'error')
        end
    elseif data.id == 10 then
        if check ~= nil then
            if check.amount >= 1 then
                Player.Functions.RemoveItem(item, 1)
                Player.Functions.AddMoney('cash', 150)
                TriggerClientEvent('QBCore:Notify', src, 'You traded 1 Pocket Watch'..' for $150.', 'success')
            else 
                TriggerClientEvent('QBCore:Notify', src, "You don't have enough Pocket Watches..", 'error')
            end 
        else 
            TriggerClientEvent('QBCore:Notify', src, "You do not have any Pocket Watches.", 'error')
        end
    end
end)
