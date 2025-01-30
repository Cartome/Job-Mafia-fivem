resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Job Mafia avec trésorerie, missions et guerre de territoire'

server_scripts {
    '@es_extended/locale.lua',
    'server/server_main.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/client_main.lua',
    'config.lua'
}

dependencies {
    'es_extended'
}
