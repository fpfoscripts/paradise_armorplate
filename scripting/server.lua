ESX = exports["es_extended"]:getSharedObject()

for plateType, config in pairs(Config.ArmorPlates) do
    ESX.RegisterUsableItem(config.item, function(source)
        TriggerClientEvent('paradise_armorplate:client:useArmor', source, plateType)
    end)
end

RegisterNetEvent('paradise_armorplate:server:removePlate', function(itemName)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    xPlayer.removeInventoryItem(itemName, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, { name = itemName }, "remove")
end)
