# qb-metaldetecting
An in-depth & multi-feature metal detecting script made for the qbcore framework.
This is my first release, I would appreciate all feedback good or bad. Feel free PR this repository with any improvements you suggest.
Made by <a href="https://github.com/plasmaFPS">plasma#2782</a> & <a href="https://github.com/euenvy">EU ENVY#9641</a>.

## Video Preview
https://www.youtube.com/watch?v=4cd9LtAMNZM

## Dependencies
- <a href="https://github.com/qbcore-framework/qb-core">**qb-core**</a>
- <a href="https://github.com/qbcore-framework/qb-menu">**qb-menu**</a>
- <a href="https://github.com/BerkieBb/qb-target">**qb-target**</a>
- <a href="https://github.com/mkafrin/PolyZone">**PolyZone**</a>

## Features
- Easy to understand config with options for script customization.
- Detector Overheat Chance
- Common & Rare Item Chances
- Peds for Common & Rare Item Trade / Sales (can disable)
- Custom Prop with animations
- Easily configurable detect locations using PolyZones

## Future Updates
- Add sell values to config
- Add locales system

## Credits
- Inspiration - <a href ="https://github.com/glitchdetector/fivem-prospecting">**fivem-prospecting**</a> & <a href ="https://github.com/Alivemonstor/al-metaldetector">**al-metaldetector**</a>
- Custom Prop made by <a href="https://www.turbosquid.com/3d-models/3d-metal-detector/1138741">**Vartanyan**</a> Converted to RAGE by <a href="https://github.com/glitchdetector/">**glitchdetector**</a> (<a href="https://creativecommons.org/licenses/by-nd/3.0/">**CC BY-ND 3.0**</a>)

## License
<a href="https://choosealicense.com/licenses/gpl-3.0/">**GNU General Public License v3.0**</a>

## Inserts (Shops / Items)

**1.** Insert the images located in the [IMAGES] folder into your inventories html > images directory.

**2. (Optional)** If you would like the metal detector purchaseable from a shop: 
- Insert this line into your qb-shops > config.lua (wherever you want it), ensure you change the array index & slot #'s to match your config.

<pre>[1] = {
  name = "metaldetector", 
  price = 500, 
  amount = 50, 
  info = {}, 
  type = "item", 
  slot = 1
},</pre>

**3.** Insert this list of items in your qb-core > shared > items.lua
<pre>-- qb-metaldetecting 

["metaldetector"] = {
    ["name"] = "metaldetector",
    ["label"] = "Metal Detector",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "metaldetector.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Detect Metal beep"
},

-- common detectable items
["metaltrash"] = {
    ["name"] = "metaltrash",
    ["label"] = "Metal Trash",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "metaltrash.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Trashed Metal"
},
["irontrash"] = {
    ["name"] = "irontrash",
    ["label"] = "Iron Trash",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "irontrash.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Trashed Iron"
},
["bulletcasings"] = {
    ["name"] = "bulletcasings",
    ["label"] = "Bullet Casings",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "bulletcasings.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Bullet Casings"
},
["aluminumcan"] = {
    ["name"] = "aluminumcan",
    ["label"] = "Aluminium Can",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "aluminiumcan.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Alumunim Cans"
},
["brokenknife"] = {
    ["name"] = "brokenknife",
    ["label"] = "Broken Knife",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "brokenknife.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Rusted Knife"
},
["brokendetector"] = {
    ["name"] = "brokendetector",
    ["label"] = "Broken Detector",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "brokendetector.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "A broken metal detector"
},
["brokenphone"] = {
    ["name"] = "brokenphone",
    ["label"] = "Broken Phone",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "brokenphone.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Broken Phone"
},
["housekeys"] = {
    ["name"] = "housekeys",
    ["label"] = "House Keys",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "housekeys.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Random House Keys"
},

-- rare detectable items

["brokengameboy"] = {
    ["name"] = "brokengameboy",
    ["label"] = "Broken Gameboy",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "brokengameboy.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "A Broken Gameboy"
},
["burriedtreasure"] = {
    ["name"] = "burriedtreasure",
    ["label"] = "Burried treasure",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "burriedtreasure.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "Burried Treasure, woah"
},
["treasurekey"] = {
    ["name"] = "treasurekey",
    ["label"] = "Treasure key",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "treasurekey.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "A key? Maybe for treasure"
},
["antiquecoin"] = {
    ["name"] = "antiquecoin",
    ["label"] = "Antique Coin",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "antiquecoin.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "This seems old..."
},
["goldennugget"] = {
    ["name"] = "goldennugget",
    ["label"] = "The Mojave Nugget",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "goldnugget.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "This seems valuable, hmm"
},
["goldcoin"] = {
    ["name"] = "goldcoin",
    ["label"] = "Gold coin",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "goldcoin.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "o.O GOLD!"
},
["ancientcoin"] = {
    ["name"] = "ancientcoin",
    ["label"] = "Ancient Coin",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "aincientcoin.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "This seems really old and unique."
},
["ww2relic"] = {
    ["name"] = "ww2relic",
    ["label"] = "WW2 Relic",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "ww2relic.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "I rememeber this from history class."
},
["steeltrash"] = {
    ["name"] = "steeltrash",
    ["label"] = "Steel Trash",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "steelcan.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["description"] = "A steel can"
},
["pocketwatch"] = {
    ["name"] = "pocketwatch",
    ["label"] = "Pocket Watch",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "pocketwatch.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A pocket watch"
},

-- other items
["gameboy"] = {
    ["name"] = "gameboy",
    ["label"] = "Gameboy",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "gameboy.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A working Gameboy."
}
</pre>
