-- Coal removal
seablock.lib.substingredient("grenade", "coal", "wood-charcoal")
seablock.lib.substingredient("explosives", "coal", "wood-charcoal")
seablock.lib.substingredient("solid-fuel-from-hydrogen", "coal", "wood-charcoal")
if mods["bobenemies"] then
  seablock.lib.substingredient("alien-poison", "coal", "wood-charcoal")
  seablock.lib.substingredient("alien-explosive", "coal", "wood-charcoal")
end
seablock.lib.substingredient("filter-coal", "coal", "wood-charcoal")
seablock.lib.substingredient("carbon", "coal", "wood-charcoal")
if mods["Transport_Drones"] then
  seablock.lib.substingredient("road", "coal", "wood-charcoal")
end
seablock.lib.substingredient("carbon-separation-2", "coal", "wood-charcoal", 1)
if mods["angelsaddons-storage"] and data.raw.recipe["silo-coal"] then
  seablock.lib.substingredient("silo-coal", "coal-crushed", "wood-charcoal", 10)
end

-- Disable coal cracking technology
seablock.lib.hide_technology("angels-coal-cracking")
seablock.lib.moveeffect("pellet-coke", "angels-coal-cracking", "angels-coal-processing-2")
angelsmods.functions.move_item("pellet-coke", "bio-processing-wood", "f[pellet-coke]")
angelsmods.functions.move_item("pellet-coke", "bio-processing-wood", "f[pellet-coke]", "recipe")

-- Clear fuel value so these don't appear in Helmod's fuel picker
data.raw.item["carbon"].fuel_emissions_multiplier = nil
data.raw.item["carbon"].fuel_value = nil
data.raw.item["carbon"].fuel_category = nil
data.raw.item["coal"].fuel_emissions_multiplier = nil
data.raw.item["coal"].fuel_value = nil
data.raw.item["coal"].fuel_category = nil
data.raw.item["coal-crushed"].fuel_value = nil
data.raw.item["coal-crushed"].fuel_category = nil

data.raw.recipe["coolant-used-filtration-1"].localised_name = { "recipe-name.coolant-used-filtration-1" }
data.raw.recipe["coolant-used-filtration-2"].localised_name = { "recipe-name.coolant-used-filtration-2" }

-- Move charcoal processing 3 to purple science
-- Sodium carbonate is unusable before then
bobmods.lib.tech.add_science_pack("angels-coal-processing-3", "chemical-science-pack", 1)
bobmods.lib.tech.add_science_pack("angels-coal-processing-3", "production-science-pack", 1)
bobmods.lib.tech.remove_prerequisite("sodium-processing-2", "angels-coal-processing-3")
bobmods.lib.tech.add_prerequisite("angels-coal-processing-3", "sodium-processing-2")

-- Buff the Carbon 2 recipe to make it a bit more worthwhile
bobmods.lib.recipe.set_result("coke-purification-2", { type = "item", name = "solid-carbon", amount = 8 })
