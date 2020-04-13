basic_tint = { r = 165, g = 165, b = 165 }
tint = { r = 210, g = 180, b = 80 }
fast_tint = { r = 210, g = 60, b = 60 }
express_tint = { r = 80, g = 180, b = 210 }
turbo_tint = { r = 165, g = 10, b = 225 }
ultimate_tint = { r = 10, g = 225, b = 25 }
filter_tint = { r = 0, g = 0, b = 0 }

for k, v in pairs(data.raw.tree) do
    data.raw.tree[k].autoplace = nil
end

for k, v in pairs(data.raw.tile) do
    if (string.match(k, ".*water.*") == k) then
        data.raw.tile[k].autoplace = nil
    end
end

if settings.startup["bobs-water"].value == false then
    data.raw.resource["ground-water"] = nil
    data.raw["autoplace-control"]["ground-water"] = nil
    data.raw["map-gen-presets"].default["rich-resources"].basic_settings.autoplace_controls["ground-water"] = nil
    data.raw["map-gen-presets"].default["rail-world"].basic_settings.autoplace_controls["ground-water"] = nil
    data.raw["map-gen-presets"].default["ribbon-world"].basic_settings.autoplace_controls["ground-water"] = nil
    if data.raw.technology["void-fluid"] then
        data.raw.technology["void-fluid"] = null
    end
    for k, v in pairs(data.raw.recipe) do
        if (string.match(k, "*water-miner-*") == k) then
            data.raw.recipe[k].enabled = false
        end
    end
end

data.raw.item["wood"].stack_size = 500
data.raw.item["wood"].fuel_value = nil
data.raw.item["small-electric-pole"].fuel_value = nil
data.raw.item["seedling"].fuel_value = nil
data.raw.recipe["wooden-chest"].enabled = false
data.raw.recipe["chute-miniloader"].enabled = false

bobmods.lib.recipe.replace_ingredient_in_all("wooden-chest", "iron-chest")

bobmods.lib.recipe.replace_ingredient("rail", "iron-stick", "wood")

bobmods.lib.tech.remove_recipe_unlock("logistics", "transport-belt-loader")
bobmods.lib.tech.remove_recipe_unlock("logistics-2", "fast-transport-belt-loader")
bobmods.lib.tech.remove_recipe_unlock("logistics-3", "express-transport-belt-loader")

if mods["boblogistics"] then
    bobmods.lib.tech.remove_recipe_unlock("logistics-0", "basic-transport-belt-loader")
    bobmods.lib.tech.remove_recipe_unlock("logistics-4", "turbo-transport-belt-loader")
    bobmods.lib.tech.remove_recipe_unlock("logistics-5", "ultimate-transport-belt-loader")
    bobmods.lib.recipe.replace_ingredient("basic-splitter", "wood", "iron-stick")
end

if mods["bobplates"] then
    bobmods.lib.recipe.replace_ingredient("bob-greenhouse", "glass", "copper-plate")
end

require("prototypes.entity.entity-final")
require("prototypes.item.item-final")
require("prototypes.recipe.recipe-final")
require("prototypes.technology.technology-final")

if mods["boblogistics"] then
    data.raw["loader-1x1"]["basic-transport-belt-loader"].localised_description = { "entity-description.basic-deadlock-loader" }
    data.raw.recipe["basic-transport-belt-loader"].localised_description = { "entity-description.basic-deadlock-loader" }
    data.raw.recipe["basic-transport-belt-loader"].subgroup = "bob-logistic-tier-0"
    data.raw.recipe["basic-transport-belt-loader"].order = "f"
end

if mods["boblogistics"] then
    if mods["beltlayer"] then
        data.raw["item-subgroup"]["beltboxes"].group = "bob-logistics"
    else
        data.raw.recipe["basic-transport-belt-beltbox"].subgroup = "bob-logistic-tier-0"
        data.raw.recipe["basic-transport-belt-beltbox"].order = "g"
        data.raw.recipe["transport-belt-beltbox"].subgroup = "bob-logistic-tier-1"
        data.raw.recipe["transport-belt-beltbox"].order = "g"
        data.raw.recipe["fast-transport-belt-beltbox"].subgroup = "bob-logistic-tier-2"
        data.raw.recipe["fast-transport-belt-beltbox"].order = "g"
        data.raw.recipe["express-transport-belt-beltbox"].subgroup = "bob-logistic-tier-3"
        data.raw.recipe["express-transport-belt-beltbox"].order = "g"
        data.raw.recipe["turbo-transport-belt-beltbox"].subgroup = "bob-logistic-tier-4"
        data.raw.recipe["turbo-transport-belt-beltbox"].order = "g"
        data.raw.recipe["ultimate-transport-belt-beltbox"].subgroup = "bob-logistic-tier-5"
        data.raw.recipe["ultimate-transport-belt-beltbox"].order = "g"
    end
end

if not mods["bobplates"] then
    bobmods.lib.recipe.replace_ingredient("fast-transport-belt-beltbox", "steel-gear-wheel", "iron-gear-wheel")
end

autoplace_table_value = { frequency = 0.33333333333, size = 3, richness = 1.5 }

if not mods["omnimatter"] then
    data.raw["map-gen-presets"].default = {
        type = "map-gen-presets",
        name = "default",
        ["project-corona"] = {
            order = "1",
            basic_settings = {
                autoplace_controls = {
                    ["coal"] = autoplace_table_value,
                    ["copper-ore"] = autoplace_table_value,
                    ["crude-oil"] = autoplace_table_value,
                    ["iron-ore"] = autoplace_table_value,
                    ["stone"] = autoplace_table_value,
                    ["uranium-ore"] = autoplace_table_value,
                },
            },
            advanced_settings = {
                pollution = {
                    enabled = true,
                    ageing = 2, -- Also known as dissipation rate. Must be >= 0.5.
                    enemy_attack_pollution_consumption_modifier = 1, -- Atack Cost Modifier
                    min_pollution_to_damage_trees = 0,
                    pollution_restored_per_tree_damage = 0,
                    diffusion_ratio = 0.01, -- Must be <= 0.25.
                },
                enemy_evolution = {
                    enabled = true,
                    time_factor = 2.5e-06, -- 2.5e-06 = 0.0000025 = 25
                    destroy_factor = 2.5e-03, -- 2.5e-03 = 0.0025000 = 250
                    pollution_factor = 1e-06, -- 1e-06 = 0.0000010 = 10
                },
                enemy_expansion = {
                    enabled = true,
                    max_expansion_distance = 10,
                    settler_group_min_size = 10,
                    settler_group_max_size = 20,
                    min_expansion_cooldown = 54000, -- In ticks
                    max_expansion_cooldown = 162000, -- In ticks
                },
                difficulty_settings = {
                    recipe_difficulty = 0,
                    technology_difficulty = 0,
                    technology_price_multiplier = 1,
                    research_queue_setting = "never", --Either "after-victory", "always" or "never".
                }
            }
        },
        default = {
            default = true,
            order = "a"
        },
    }
else
    data.raw["map-gen-presets"].default = {
        type = "map-gen-presets",
        name = "default",
        ["project-corona"] = {
            order = "1",
            basic_settings = {
                autoplace_controls = {
                    ["omnite"] = autoplace_table_value
                },
            },
            advanced_settings = {
                pollution = {
                    enabled = true,
                    ageing = 2, -- Also known as dissipation rate. Must be >= 0.5.
                    enemy_attack_pollution_consumption_modifier = 1, -- Atack Cost Modifier
                    min_pollution_to_damage_trees = 0,
                    pollution_restored_per_tree_damage = 0,
                    diffusion_ratio = 0.01, -- Must be <= 0.25.
                },
                enemy_evolution = {
                    enabled = true,
                    time_factor = 2.5e-06, -- 2.5e-06 = 0.0000025 = 25
                    destroy_factor = 2.5e-03, -- 2.5e-03 = 0.0025000 = 250
                    pollution_factor = 1e-06, -- 1e-06 = 0.0000010 = 10
                },
                enemy_expansion = {
                    enabled = true,
                    max_expansion_distance = 10,
                    settler_group_min_size = 10,
                    settler_group_max_size = 20,
                    min_expansion_cooldown = 54000, -- In ticks
                    max_expansion_cooldown = 162000, -- In ticks
                },
                difficulty_settings = {
                    recipe_difficulty = 0,
                    technology_difficulty = 0,
                    technology_price_multiplier = 1,
                    research_queue_setting = "never", --Either "after-victory", "always" or "never".
                }
            }
        },
        default = {
            default = true,
            order = "a"
        },
    }
end

--[[
local data_string = data.raw["map-gen-presets"].default["project-corona"].basic_settings.autoplace_controls

if mods["bobores"] then
    if data.raw.item["gold-ore"].autoplace_controls == true then
        table.insert(data_string, {["gold-ore"] = autoplace_table_value})
    end
    if data.raw.item["lead-ore"].autoplace_controls == true then
        table.insert(data_string, {["lead-ore"] = autoplace_table_value})
    end
    if data.raw.item["silver-ore"].autoplace_controls == true then
        table.insert(data_string, {["silver-ore"] = autoplace_table_value})
    end
    if data.raw.item["tin-ore"].autoplace_controls == true then
        table.insert(data_string, {["tin-ore"] = autoplace_table_value})
    end
    if data.raw.item["tungsten-ore"].autoplace_controls == true then
        table.insert(data_string, {["tungsten-ore"] = autoplace_table_value})
    end
    if data.raw.item["zinc-ore"].autoplace_controls == true then
        table.insert(data_string, {["zinc-ore"] = autoplace_table_value})
    end
    if data.raw.item["bauxite-ore"].autoplace_controls == true then
        table.insert(data_string, {["bauxite-ore"] = autoplace_table_value})
    end
    if data.raw.item["rutile-ore"].autoplace_controls == true then
        table.insert(data_string, {["rutile-ore"] = autoplace_table_value})
    end
    if data.raw.item["nickel-ore"].autoplace_controls == true then
        table.insert(data_string, {["nickel-ore"] = autoplace_table_value})
    end
    if data.raw.item["cobalt-ore"].autoplace_controls == true then
        table.insert(data_string, {["cobalt-ore"] = autoplace_table_value})
    end
    if data.raw.item["quartz"].autoplace_controls == true then
        table.insert(data_string, {["quartz"] = autoplace_table_value})
    end
    if data.raw.item["sulfur"].autoplace_controls == true then
        table.insert(data_string, {["sulfur"] = autoplace_table_value})
    end
    if data.raw.item["thorium-ore"].autoplace_controls == true then
        table.insert(data_string, {["thorium-ore"] = autoplace_table_value})
    end
end
--]]
