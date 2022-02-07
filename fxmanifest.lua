fx_version 'cerulean'
game 'gta5'

author 'plasma#2782 & EU ENVY#9641'
description 'Simple QB metal detecting script'
version '1.0'

client_scripts {
    'client/**.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_script 'server/sv_main.lua'
shared_script 'config.lua'