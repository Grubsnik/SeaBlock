-- Swap out concrete for bricks

if data.raw.recipe["burner-reactor-2"] then
  seablock.lib.substingredient("burner-reactor-2", "concrete", "concrete-brick", nil)
  bobmods.lib.tech.remove_prerequisite("burner-reactor-2", "concrete")
  bobmods.lib.tech.add_prerequisite("burner-reactor-2", "angels-stone-smelting-2")
end
seablock.lib.substingredient("centrifuge", "concrete", "concrete-brick", nil)
if data.raw.recipe["fluid-reactor-2"] then
  seablock.lib.substingredient("fluid-reactor-2", "concrete", "concrete-brick", nil)
end
seablock.lib.substingredient("nuclear-reactor", "concrete", "concrete-brick", nil)
seablock.lib.substingredient("rocket-silo", "concrete", "reinforced-concrete-brick", nil)

bobmods.lib.tech.replace_prerequisite("uranium-processing", "concrete", "angels-stone-smelting-2")
bobmods.lib.tech.replace_prerequisite("rocket-silo", "concrete", "angels-stone-smelting-3")

-- Swap concrete tiles
local item = data.raw.item["concrete-brick"]
if item and item.place_as_tile then
  item.place_as_tile["result"] = "concrete"
end
item = data.raw.item["reinforced-concrete-brick"]
if item and item.place_as_tile then
  item.place_as_tile["result"] = "refined-concrete"
end
item = data.raw.item["concrete"]
if item and item.place_as_tile then
  item.place_as_tile["result"] = "tile-concrete-brick"
end
item = data.raw.item["refined-concrete"]
if item and item.place_as_tile then
  item.place_as_tile["result"] = "tile-reinforced-concrete-brick"
end

item = data.raw.tile["concrete"]
if item then
  item.minable["result"] = "concrete-brick"
  item.placeable_by = { item = "concrete-brick", count = 1 }
  item.walking_speed_modifier = 1.4
end
item = data.raw.tile["refined-concrete"]
if item then
  item.minable["result"] = "reinforced-concrete-brick"
  item.placeable_by = { item = "reinforced-concrete-brick", count = 1 }
  item.walking_speed_modifier = 1.55
end
item = data.raw.tile["tile-concrete-brick"]
if item then
  item.minable["result"] = "concrete"
  item.placeable_by = { item = "concrete", count = 1 }
  item.walking_speed_modifier = 1.4
end
item = data.raw.tile["tile-reinforced-concrete-brick"]
if item then
  item.minable["result"] = "refined-concrete"
  item.placeable_by = { item = "refined-concrete", count = 1 }
  item.walking_speed_modifier = 1.55
end
item = data.raw.tile["hazard-concrete-left"]
if item then
  item.walking_speed_modifier = 1.4
end
item = data.raw.tile["hazard-concrete-right"]
if item then
  item.walking_speed_modifier = 1.4
end
item = data.raw.tile["refined-hazard-concrete-left"]
if item then
  item.walking_speed_modifier = 1.55
end
item = data.raw.tile["refined-hazard-concrete-right"]
if item then
  item.walking_speed_modifier = 1.55
end
