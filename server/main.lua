---------------------------------------
--     ESX_DRUGLABS by Dividerz      --
-- FOR SUPPORT: Arne#7777 on Discord --
---------------------------------------

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_druglabs:server:hasMethKey', function(source, cb)
    local sourcePlayer = ESX.GetPlayerFromId(source)

    if sourcePlayer.getInventoryItem('methkey') ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('esx_druglabs:server:hasCokeKey', function(source, cb)
    local sourcePlayer = ESX.GetPlayerFromId(source)

    if sourcePlayer.getInventoryItem('cokekey') ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('esx_druglabs:server:clearCokeStorage')
AddEventHandler('esx_druglabs:server:clearCokeStorage', function(amount)
    local sourcePlayer = ESX.GetPlayerFromId(source)

    if sourcePlayer.canCarryItem('cokebag', amount) then
        sourcePlayer.addInventoryItem('cokebag', amount)
        sourcePlayer.showNotification("You cleared up the storage and got ~y~" .. amount .. "~w~ bags of cocaine.")
    else
        sourcePlayer.showNotification("You can't carry this amount of bags...")
    end
end)

RegisterNetEvent('esx_druglabs:server:clearMethStorage')
AddEventHandler('esx_druglabs:server:clearMethStorage', function(amount)
    local sourcePlayer = ESX.GetPlayerFromId(source)

    if sourcePlayer.canCarryItem('methbag', amount) then
        sourcePlayer.addInventoryItem('methbag', amount)
        sourcePlayer.showNotification("You cleared up the storage and got ~y~" .. amount .. "~w~ bags of meth.")
    else
        sourcePlayer.showNotification("You can't carry this amount of bags...")
    end
end)
