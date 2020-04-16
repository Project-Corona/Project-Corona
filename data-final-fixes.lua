require("prototypes.entity.entity-final")
require("prototypes.item.item-final")
require("prototypes.recipe.recipe-final")
require("prototypes.technology.technology-final")

--- Waterless Map
if settings.startup["waterless-map"].value == true and mods["StoneWaterWell"] then
    if mods["bobores"] and mods["bobmining"] then
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
    for k, v in pairs(data.raw.tile) do
        if (string.match(k, ".*water.*") == k) then
            data.raw.tile[k].autoplace = nil
        end
    end
elseif settings.startup["waterless-map-forced"].value == true then
    if mods["bobores"] and mods["bobmining"] then
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
    for k, v in pairs(data.raw.tile) do
        if (string.match(k, ".*water.*") == k) then
            data.raw.tile[k].autoplace = nil
        end
    end
elseif settings.startup["waterless-map"].value == true and mods["bobores"] and mods["bobmining"] then
    settings.startup["bobmods-ores-enablewaterores"].value = true
    settings.startup["bobmods-mining-waterminers"].value = true
    for k, v in pairs(data.raw.tile) do
        if (string.match(k, ".*water.*") == k) then
            data.raw.tile[k].autoplace = nil
        end
    end
end

--- Project Corona Map Gen Preset
data.raw["map-gen-presets"].default = {
    type = "map-gen-presets",
    name = "default",
    ["project-corona"] = {
        order = "1",
        basic_settings = {
            autoplace_controls = {}
        },
        advanced_settings = {
            pollution = {
                enabled = true,
                ageing = 4, -- Also known as dissipation rate. Must be >= 0.5.
                enemy_attack_pollution_consumption_modifier = 4, -- Atack Cost Modifier
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

local autoplace_value = { frequency = 0.33333333333, size = 3, richness = 1.5 }

local data_string = data.raw["map-gen-presets"].default["project-corona"].basic_settings.autoplace_controls

if not mods["bobores"] and not mods["omnimatter"] then
    data_string["coal"] = autoplace_value
    data_string["copper-ore"] = autoplace_value
    data_string["crude-oil"] = autoplace_value
    data_string["iron-ore"] = autoplace_value
    data_string["stone"] = autoplace_value
    data_string["uranium-ore"] = autoplace_value
elseif not mods["bobores"] and mods["omnimatter"] then
    data_string["omnite"] = autoplace_value
elseif mods["bobores"] and mods["omnimatter"] then
    if settings.startup["bobmods-ores-enablethoriumore"].value == true then
        data_string["omnite"] = autoplace_value
        data_string["thorium-ore"] = autoplace_value
    end
    if mods["bobmining"] then
        if settings.startup["bobmods-ores-enablewaterores"].value == true and settings.startup["bobmods-mining-waterminers"].value == true and settings.startup["waterless-map"].value == true then
            data_string["ground-water"] = autoplace_value
            data_string["lithia-water"] = autoplace_value
        end
    end
elseif mods["bobores"] and not mods["omnimatter"] then
    data_string["coal"] = autoplace_value
    data_string["copper-ore"] = autoplace_value
    data_string["crude-oil"] = autoplace_value
    data_string["iron-ore"] = autoplace_value
    data_string["stone"] = autoplace_value
    data_string["uranium-ore"] = autoplace_value
    if settings.startup["bobmods-ores-enablebauxite"].value == true then
        data_string["bauxite-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablecobaltore"].value == true then
        data_string["cobalt-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablegemsore"].value == true then
        data_string["gem-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablegoldore"].value == true then
        data_string["gold-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enableleadore"].value == true then
        data_string["lead-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablenickelore"].value == true then
        data_string["nickel-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablequartz"].value == true then
        data_string["quartz"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablerutile"].value == true then
        data_string["rutile-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablesilverore"].value == true then
        data_string["silver-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablesulfur"].value == true then
        data_string["sulfur"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enabletinore"].value == true then
        data_string["tin-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enabletungstenore"].value == true then
        data_string["tungsten-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablezincore"].value == true then
        data_string["zinc-ore"] = autoplace_value
    end
    if settings.startup["bobmods-ores-enablethoriumore"].value == true then
        data_string["thorium-ore"] = autoplace_value
    end
    if mods["bobmining"] then
        if settings.startup["bobmods-ores-enablewaterores"].value == true and settings.startup["bobmods-mining-waterminers"].value == true then
            data_string["ground-water"] = autoplace_value
            data_string["lithia-water"] = autoplace_value
        end
    end
end

--- Treeless Map
if settings.startup["treeless-map"] == true then
    require("__bobgreenhouse__.data")
    require("__bobgreenhouse__.data-updates")
    for k, v in pairs(data.raw.tree) do
        data.raw.tree[k].autoplace = nil
    end
    bobmods.lib.recipe.replace_ingredient_in_all("wooden-chest", "iron-chest")
    data.raw.recipe["wooden-chest"].enabled = false
    data.raw.item["wood"].stack_size = 500
    data.raw.item["wood"].fuel_value = nil
    data.raw.item["small-electric-pole"].fuel_value = nil
    data.raw.item["seedling"].fuel_value = nil
else
    settings.startup["treeless-map"] = false
    data_string["trees"] = { size = 0.5, richness = 1 }
    data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.ageing = 1
    data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.enemy_attack_pollution_consumption_modifier = 1
    data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.min_pollution_to_damage_trees = 60
    data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.pollution_restored_per_tree_damage = 10
    data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.diffusion_ratio = 0.02 -- Must be <= 0.25.
end
