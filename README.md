qb-metaldetector

A in depth metal detector script for Qb-core made by PLASMA#2782 & EU ENVY#9641 at 4am whilst bored hopefully you enjoy!!

-- Features
 Chance of your metal detector overheating (time can be changed in the config)
 traders to trade all items found.
 checks to stop the prop getting stuck in your hand.
 custom items! (you can change these how you like)
 metal detector sound effects!
 Configurable item chances!
 
 

--dependencies

# https://github.com/qbcore-framework
# Interact sound 
# polyzone
# qb-target


---How to install---

-- Simply drag the Qb-metaldetector into you Resources folder.

-- add all .png to your inventory (qb-inventory/html/images)

-- Make sure you add to your items.lua (qb-core/shared/items.lua)

-- Make sure to Add the peds to you qb-target (qb-target/config.lua)

	-- metaldetector shit
	["metaldetector"]                   = {["name"] = "metaldetector",              ["label"] = "Metal Detector",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "metaldetector.png",        		["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["metaltrash"]                  	= {["name"] = "metaltrash",              	["label"] = "Metal Trash",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "metaltrash.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["irontrash"]                   	= {["name"] = "irontrash",              	["label"] = "Iron Trash",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "irontrash.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["bulletcasings"]                   = {["name"] = "bulletcasings",              ["label"] = "Bullet Casings",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "bulletcasings.png",        		["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["aluminumcan"]                  	= {["name"] = "aluminumcan",              	["label"] = "Aluminium Can",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "aluminiumcan.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["steeltrash"]                  	= {["name"] = "steeltrash",              	["label"] = "Steel Can",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "steelcan.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["pocketwatch"]                	    = {["name"] = "pocketwatch",              	["label"] = "Pocket Watch",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "pocketwatch.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["brokenknife"]                	    = {["name"] = "brokenknife",              	["label"] = "Broken Knife",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "brokenknife.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["brokendetector"]                  = {["name"] = "brokendetector",             ["label"] = "Broken Detector",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "brokendetector.png",        		["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["brokenphone"]                   	= {["name"] = "brokenphone",              	["label"] = "Broken Phone",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "brokenphone.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["housekeys"]                   	= {["name"] = "housekeys",              	["label"] = "House keys",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "housekeys.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["brokengameboy"]                   = {["name"] = "brokengameboy",              ["label"] = "Broken Gameboy",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "brokengameboy.png",        		["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["burriedtreasure"]                 = {["name"] = "burriedtreasure",          	["label"] = "Burried treasure",        	["weight"] = 200,       ["type"] = "item",      ["image"] = "burriedtreasure.png",        		["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["treasurekey"]                     = {["name"] = "treasurekey",              	["label"] = "Treasure key",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "treasurekey.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["antiquecoin"]                   	= {["name"] = "antiquecoin",              	["label"] = "Antique Coin",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "antiquecoin.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["goldennugget"]                    = {["name"] = "goldennugget",               ["label"] = "The Mojave Nugget",        ["weight"] = 200,       ["type"] = "item",      ["image"] = "goldnugget.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["goldcoin"]                   	    = {["name"] = "goldcoin",              		["label"] = "Gold coin",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "goldcoin.png",        				["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["ancientcoin"]                     = {["name"] = "ancientcoin",              	["label"] = "Ancient Coin",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "aincientcoin.png",        			["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
	["ww2relic"]                        = {["name"] = "ww2relic",              		["label"] = "WW2 Relic",        		["weight"] = 200,       ["type"] = "item",      ["image"] = "ww2relic.png",        				["unique"] = false,     ["useable"] = true,      ["shouldClose"] = true,  ["combinable"] = nil,   ["description"] = "*beep*, *beep*"},
 
 -- peds
 
     -- metaldetector
    ["Metaldetectorped"] = {
        model = 'mp_m_forgery_01', 
        coords = vector4(-1158.44, -1986.14, 13.16, 322.02),
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-metaldetector:tradingmenu",
                    icon = "fas fa-user-secret",
                    label = "Trade your Finds"
                }
            },
         distance = 3,
         }
    },

    ["Metaldetectorped1"] = {
        model = 'mp_m_weapexp_01', 
        coords = vector4(-2085.17, -1017.98, 12.78, 74.19),
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-metaldetector:Raretradingmenu",
                    icon = "fas fa-user-secret",
                    label = "Trade your Rare Finds"
                }
            },
         distance = 3,
         }
    },
 

