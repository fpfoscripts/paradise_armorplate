# Armor Plate System (ESX)

## [Preview](https://youtu.be/34XZO9kEaJM)

## Prerequisites

- ESX
- ox_lib

## Installation

### For ox_inventory Users

Add the following to `ox_inventory/data/items.lua`:

```lua
['armor_plate1'] = {
    label = 'Armor Plate',
    weight = 1000,
    stack = true,
    description = 'A basic armor plate for street protection',
    client = {
        image = "armorplate.png",
    }
},

['armor_plate2'] = {
    label = 'Police Armor Plate',
    weight = 1000,
    stack = true,
    description = 'High-quality police-grade armor plate',
    client = {
        image = "armorplate.png",
    }
},

['armor_vest'] = {
    label = 'Armor Vest',
    weight = 1000,
    stack = true,
    description = 'A Vest To Apply Plates',
    client = {
        image = "armor_vest.png",
    }
},
```

Then copy the images from the `images` folder to:
- `ox_inventory/web/images`


## File Structure

```
📦 paradise_armorplate
 ┣ 📂 images
 ┃ ┣ 📜 armorplate.png
 ┃ ┗ 📜 armor_vest.png
 ┗ 📜 README.md
```
