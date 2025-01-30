ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('mafia:getWeapon')
AddEventHandler('mafia:getWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        xPlayer.addWeapon('WEAPON_PISTOL', 50)
        TriggerClientEvent('esx:showNotification', source, "Vous avez reçu un pistolet et des munitions.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

RegisterNetEvent('mafia:getBlackMoney')
AddEventHandler('mafia:getBlackMoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        xPlayer.addAccountMoney('black_money', 1000)
        TriggerClientEvent('esx:showNotification', source, "Vous avez reçu de l'argent sale.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

RegisterNetEvent('mafia:openTreasury')
AddEventHandler('mafia:openTreasury', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' and (xPlayer.job.grade_name == 'parrain' or xPlayer.job.grade_name == 'bras_droit') then
        TriggerClientEvent('esx:showNotification', source, "Vous accédez à la trésorerie de la Mafia.")
    else
        TriggerClientEvent('esx:showNotification', source, "Seul le Parrain et le Bras Droit peuvent accéder à la trésorerie.")
    end
end)

-- Missions Mafia
RegisterNetEvent('mafia:startMission')
AddEventHandler('mafia:startMission', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        local reward = math.random(2000, 5000)
        xPlayer.addAccountMoney('black_money', reward)
        TriggerClientEvent('esx:showNotification', source, "Mission accomplie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

RegisterNetEvent('mafia:deliverDrugs')
AddEventHandler('mafia:deliverDrugs', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        local reward = math.random(3000, 7000)
        xPlayer.addAccountMoney('black_money', reward)
        TriggerClientEvent('esx:showNotification', source, "Livraison de drogue réussie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

RegisterNetEvent('mafia:robbery')
AddEventHandler('mafia:robbery', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        local reward = math.random(5000, 10000)
        xPlayer.addAccountMoney('black_money', reward)
        TriggerClientEvent('esx:showNotification', source, "Braquage réussi ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Système de racket
RegisterNetEvent('mafia:racket')
AddEventHandler('mafia:racket', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if xPlayer.job.name == 'mafia' then
        if targetPlayer then
            local amount = math.random(500, 2000)
            if targetPlayer.getMoney() >= amount then
                targetPlayer.removeMoney(amount)
                xPlayer.addAccountMoney('black_money', amount)
                TriggerClientEvent('esx:showNotification', source, "Vous avez racketté " .. amount .. "$.")
                TriggerClientEvent('esx:showNotification', targetId, "Vous vous êtes fait racketter de " .. amount .. "$.")
            else
                TriggerClientEvent('esx:showNotification', source, "La cible n'a pas assez d'argent.")
            end
        else
            TriggerClientEvent('esx:showNotification', source, "Joueur introuvable.")
        end
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Protection des commerces
RegisterNetEvent('mafia:protectBusiness')
AddEventHandler('mafia:protectBusiness', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        local reward = math.random(3000, 6000)
        xPlayer.addAccountMoney('black_money', reward)
        TriggerClientEvent('esx:showNotification', source, "Protection des commerces réussie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Guerre de territoire
RegisterNetEvent('mafia:startTerritoryWar')
AddEventHandler('mafia:startTerritoryWar', function(territory)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        TriggerClientEvent('mafia:notifyWar', -1, territory)
        TriggerClientEvent('esx:showNotification', source, "La guerre pour " .. territory .. " a commencé !")
    else
        TriggerClientEvent('esx:showNotification', source, "Seule la Mafia peut lancer une guerre de territoire.")
    end
end)

RegisterNetEvent('mafia:winTerritory')
AddEventHandler('mafia:winTerritory', function(territory)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mafia' then
        TriggerClientEvent('esx:showNotification', -1, "La Mafia a pris le contrôle de " .. territory .. " !")
    end
end)
