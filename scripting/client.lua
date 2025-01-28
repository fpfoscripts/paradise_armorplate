ESX = exports["es_extended"]:getSharedObject()

local function HasArmorVest()
    local xPlayer = ESX.GetPlayerData()
    local hasVest = false

    for _, item in pairs(xPlayer.inventory) do
        if item.name == Config.RequiredVest and item.count > 0 then
            hasVest = true
            break
        end
    end

    return hasVest
end

local function CanUseArmorType(armorType)
    local xPlayer = ESX.GetPlayerData()
    local jobName = xPlayer.job.name

    if Config.ArmorPlates[armorType].jobs == nil then
        return true
    end

    return Config.ArmorPlates[armorType].jobs[jobName] == true
end

local function ApplyArmorPlate(plateType)
    local armorConfig = Config.ArmorPlates[plateType]

    if not HasArmorVest() then
        TriggerEvent('esx:showNotification', '~r~You need an armor vest to apply plates!')
        return
    end

    if not CanUseArmorType(plateType) then
        TriggerEvent('esx:showNotification', '~r~You cannot use this type of armor plate!')
        return
    end

    local currentArmor = GetPedArmour(PlayerPedId())
    if currentArmor >= armorConfig.maxArmor then
        TriggerEvent('esx:showNotification', '~r~Maximum armor capacity reached!')
        return
    end

    if lib.progressCircle({
        duration = armorConfig.useTime,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'clothingshirt',
            clip = 'try_shirt_positive_d',
            flag = 49
        },
    }) then
        local newArmor = math.min(currentArmor + armorConfig.armorIncrease, armorConfig.maxArmor)
        SetPedArmour(PlayerPedId(), newArmor)
        TriggerServerEvent('paradise_armorplate:server:removePlate', armorConfig.item)
        TriggerEvent('esx:showNotification', '~g~Armor plate applied successfully!')
    else
        TriggerEvent('esx:showNotification', '~r~Cancelled applying armor plate!')
    end
end

RegisterNetEvent('paradise_armorplate:client:useArmor', function(plateType)
    ApplyArmorPlate(plateType)
end)
