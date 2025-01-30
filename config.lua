Config = {}

-- Configurations générales du job Mafia
Config.JobName = "mafia"
Config.TreasuryAccess = {"parrain", "bras_droit"} -- Grades ayant accès à la trésorerie
Config.MafiaHQ = vector3(-810.0, 175.0, 76.75) -- Quartier général de la Mafia (Maison de Michael)

-- Récompenses des missions
Config.MissionRewards = {
    Min = 2000,
    Max = 5000
}

Config.DrugDeliveryRewards = {
    Min = 3000,
    Max = 7000
}

Config.RobberyRewards = {
    Min = 5000,
    Max = 10000
}

-- Système de racket
Config.Racket = {
    Min = 500,
    Max = 2000
}

-- Protection des commerces
Config.ProtectionRewards = {
    Min = 3000,
    Max = 6000
}

-- Territoires disponibles pour les guerres
Config.Territories = {
    {name = "Downtown", position = vector3(200.0, -900.0, 30.0)},
    {name = "Grove Street", position = vector3(-50.0, -1800.0, 25.0)},
    {name = "Vinewood", position = vector3(600.0, 300.0, 90.0)}
}

return Config
