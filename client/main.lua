ESX = exports['es_extended']:getSharedObject()

-- Fonction pour vérifier si le joueur est un membre de la mafia
function isMafiaMember()
    local xPlayer = ESX.GetPlayerData()
    return xPlayer.job.name == 'mafia'
end

-- Fonction pour envoyer des notifications
function sendNotification(message)
    TriggerEvent('esx:showNotification', message)
end

-- Récupérer une arme pour les membres de la mafia
RegisterNetEvent('mafia:getWeapon')
AddEventHandler('mafia:getWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        xPlayer.addWeapon('WEAPON_PISTOL', 50)
        sendNotification("Vous avez reçu un pistolet et des munitions.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Recevoir de l'argent sale
RegisterNetEvent('mafia:getBlackMoney')
AddEventHandler('mafia:getBlackMoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        xPlayer.addAccountMoney('black_money', 1000)
        sendNotification("Vous avez reçu de l'argent sale.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Accéder à la trésorerie de la mafia
RegisterNetEvent('mafia:openTreasury')
AddEventHandler('mafia:openTreasury', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() and (xPlayer.job.grade_name == 'parrain' or xPlayer.job.grade_name == 'bras_droit') then
        sendNotification("Vous accédez à la trésorerie de la Mafia.")
    else
        sendNotification("Seul le Parrain et le Bras Droit peuvent accéder à la trésorerie.")
    end
end)

-- Commencer une mission mafia
RegisterNetEvent('mafia:startMission')
AddEventHandler('mafia:startMission', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        local reward = math.random(2000, 5000)
        xPlayer.addAccountMoney('black_money', reward)
        sendNotification("Mission accomplie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Livraison de drogue réussie
RegisterNetEvent('mafia:deliverDrugs')
AddEventHandler('mafia:deliverDrugs', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        local reward = math.random(3000, 7000)
        xPlayer.addAccountMoney('black_money', reward)
        sendNotification("Livraison de drogue réussie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Réaliser un braquage
RegisterNetEvent('mafia:robbery')
AddEventHandler('mafia:robbery', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        local reward = math.random(5000, 10000)
        xPlayer.addAccountMoney('black_money', reward)
        sendNotification("Braquage réussi ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Racket sur une autre cible
RegisterNetEvent('mafia:racket')
AddEventHandler('mafia:racket', function(targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    if isMafiaMember() then
        if targetPlayer then
            local amount = math.random(500, 2000)
            if targetPlayer.getMoney() >= amount then
                targetPlayer.removeMoney(amount)
                xPlayer.addAccountMoney('black_money', amount)
                sendNotification("Vous avez racketté " .. amount .. "$.")
                TriggerClientEvent('esx:showNotification', targetId, "Vous vous êtes fait racketter de " .. amount .. "$.")
            else
                sendNotification("La cible n'a pas assez d'argent.")
            end
        else
            sendNotification("Joueur introuvable.")
        end
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Protéger un commerce
RegisterNetEvent('mafia:protectBusiness')
AddEventHandler('mafia:protectBusiness', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        local reward = math.random(3000, 6000)
        xPlayer.addAccountMoney('black_money', reward)
        sendNotification("Protection des commerces réussie ! Vous avez gagné " .. reward .. "$ d'argent sale.")
    else
        sendNotification("Vous n'êtes pas membre de la Mafia.")
    end
end)

-- Démarrer une guerre de territoire
RegisterNetEvent('mafia:startTerritoryWar')
AddEventHandler('mafia:startTerritoryWar', function(territory)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        TriggerClientEvent('mafia:notifyWar', -1, territory)
        sendNotification("La guerre pour " .. territory .. " a commencé !")
    else
        sendNotification("Seule la Mafia peut lancer une guerre de territoire.")
    end
end)

-- Gagner un territoire
RegisterNetEvent('mafia:winTerritory')
AddEventHandler('mafia:winTerritory', function(territory)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isMafiaMember() then
        TriggerClientEvent('esx:showNotification', -1, "La Mafia a pris le contrôle de " .. territory .. " !")
    end
end)
