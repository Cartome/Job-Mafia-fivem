Config = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 1.3, y = 1.3, z = 1.5 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 } -- Rouge pour coller au thème Mafia
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.CircleZones = {
  -- Ajout d'une zone de deal pour les missions Mafia
  DrugDealer = { coords = vector3(344.22, -2044.45, 21.54), name = "Zone de deal", color = 71, sprite = 84, radius = 1.0 },
}

Config.MafiaStations = {
  mafia = {
    AuthorizedVehicles = {
      { name = 'schafter3',   label = 'Schafter' },
      { name = 'btype',       label = 'Btype Vintage' },
      { name = 'cognoscenti', label = 'Cognoscenti' },
      { name = 'baller6',     label = 'Baller Blindé' },
    },

    Cloakrooms = {
      { x = -808.30, y = 175.77, z = 76.74 }, -- Vestiaire
    },

    Armories = {
      { x = -808.05, y = 181.02, z = 72.15 }, -- Armurerie
    },

    Vehicles = {
      {
        Spawner    = { x = -809.95, y = 190.01, z = 72.47 }, -- Point de spawn des véhicules
        SpawnPoint = { x = -811.98, y = 187.53, z = 72.47 }, -- Lieu de spawn
        Heading    = 26.27, -- Orientation du véhicule
      }
    },

    VehicleDeleters = {
      { x = -813.58, y = 159.71, z = 71.30 }, -- Suppression des véhicules
    },

    BossActions = {
      { x = -804.81, y = 176.88, z = 72.83 } -- Menu du Parrain
    },
  },
}
