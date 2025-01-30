ESX = exports['es_extended']:getSharedObject()

-- Fonction pour ouvrir le vestiaire
RegisterNetEvent('mafia:openCloakroom')
AddEventHandler('mafia:openCloakroom', function()
    OpenCloakroomMenu()
end)

function OpenCloakroomMenu()
    local elements = {
        {label = 'Tenue civile', value = 'citizen_wear'},
        {label = 'Tenue de la mafia', value = 'mafia_wear'}
    }

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
        title    = 'Vestiaire',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'citizen_wear' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        elseif data.current.value == 'mafia_wear' then
            SetMafiaOutfit()
        end
    end, function(data, menu)
        menu.close()
    end)
end

function SetMafiaOutfit()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local outfit = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 93, ['torso_2'] = 1,
            ['arms'] = 22,
            ['pants_1'] = 24, ['pants_2'] = 5,
            ['shoes_1'] = 21, ['shoes_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, outfit)
    end)
end

-- Fonction pour sortir un véhicule
RegisterNetEvent('mafia:spawnVehicle')
AddEventHandler('mafia:spawnVehicle', function(vehicleName)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local heading   = GetEntityHeading(playerPed)

    ESX.Game.SpawnVehicle(vehicleName, coords, heading, function(vehicle)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    end)
end)

-- Fonction pour interagir avec les véhicules
RegisterNetEvent('mafia:deleteVehicle')
AddEventHandler('mafia:deleteVehicle', function()
    local vehicle = ESX.Game.GetClosestVehicle()
    if vehicle then
        ESX.Game.DeleteVehicle(vehicle)
    end
end)

-- Notifier le début d'une guerre de territoire
RegisterNetEvent('mafia:notifyWar')
AddEventHandler('mafia:notifyWar', function(territory)
    ESX.ShowNotification("Guerre de territoire en cours pour " .. territory .. " !")
end)

-- Protection des commerces
RegisterNetEvent('mafia:protectBusiness')
AddEventHandler('mafia:protectBusiness', function()
    ESX.ShowNotification("Vous êtes en train de protéger un commerce sous l'influence de la Mafia.")
end)

-- Système de racket
RegisterNetEvent('mafia:racketPlayer')
AddEventHandler('mafia:racketPlayer', function()
    ESX.ShowNotification("Vous tentez de racketter un joueur...")
end)
