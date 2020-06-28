if settings.startup["enable-project-corona-map-manipulation"].value == true then
    --- Waterless Map
    if settings.startup["waterless-map"].value == true then
        if mods["StoneWaterWell"] then
            if data.raw.resource["ground-water"] then
                data.raw.resource["ground-water"] = nil
                data.raw["autoplace-control"]["ground-water"] = nil
            end
            if data.raw.resource["lithia-water"] then
                data.raw.resource["lithia-water"] = nil
            end
            for k, _ in pairs(data.raw.tile) do
                if (string.match(k, ".*water.*") == k) then
                    data.raw.tile[k].autoplace = nil
                end
            end
        elseif settings.startup["waterless-map-forced"].value == true then
            if data.raw.resource["ground-water"] then
                data.raw.resource["ground-water"] = nil
                data.raw["autoplace-control"]["ground-water"] = nil
            end
            if data.raw.resource["lithia-water"] then
                data.raw.resource["lithia-water"] = nil
            end
            for k, _ in pairs(data.raw.tile) do
                if (string.match(k, ".*water.*") == k) then
                    data.raw.tile[k].autoplace = nil
                end
            end
        end
    elseif settings.startup["waterless-map"].value == true and not mods["StoneWaterWell"] then
        if mods["bobores"] and mods["bobmining"] then
            settings.startup["bobmods-ores-enablewaterores"].value = true
            settings.startup["bobmods-mining-waterminers"].value = true
            for k, _ in pairs(data.raw.tile) do
                if (string.match(k, ".*water.*") == k) then
                    data.raw.tile[k].autoplace = nil
                end
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
                autoplace_controls = {},
                starting_area = settings.startup["pc-starting-area"].value,
                property_expression_names = {
                    ["control-setting:moisture:frequency:multiplier"] = 1,
                    ["control-setting:moisture:bias"] = -0.5,
                },
            },
            advanced_settings = {
                pollution = {
                    enabled = true,
                    ageing = 3, -- Also known as dissipation rate. Must be >= 0.5.
                    enemy_attack_pollution_consumption_modifier = 3, -- Atack Cost Modifier
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

    local function autoplace_value()
        if mods["omnimatter"] and mods["rso-mod"] then
            local autoplace_value = { frequency = 0.17, size = 1, richness = 1 }
            return autoplace_value
        elseif mods["omnimatter"] and not mods["rso-mod"] then
            local autoplace_value = { frequency = 0.33333333333, size = 2, richness = 2 }
            return autoplace_value
        else
            local autoplace_value = { frequency = 0.33333333333, size = 3, richness = 1.5 }
            return autoplace_value
        end
    end

    local data_string = data.raw["map-gen-presets"].default["project-corona"].basic_settings.autoplace_controls

    local resource_table = {
        --- Vanilla
        "coal",
        "copper-ore",
        "crude-oil",
        "iron-ore",
        "stone",
        "uranium-ore",

        --- Omnimatter
        "omnite",

        --- Bob's Ores
        "bauxite-ore",
        "cobalt-ore",
        "gem-ore",
        "gold-ore",
        "lead-ore",
        "nickel-ore",
        "quartz",
        "rutile-ore",
        "silver-ore",
        "sulfur",
        "tin-ore",
        "tungsten-ore",
        "zinc-ore",
        "thorium-ore",
        "ground-water",
    }

    for _, name in pairs(resource_table) do
        if data.raw.resource[name] then
            data_string[name] = autoplace_value()
        end
    end

    --- Treeless Map
    if settings.startup["treeless-map"].value == true then
        if mods["bobgreenhouse"] then
            for k, _ in pairs(data.raw.tree) do
                data.raw.tree[k].autoplace = nil
            end
            bobmods.lib.recipe.replace_ingredient_in_all("wooden-chest", "iron-chest")
            data.raw.recipe["wooden-chest"].enabled = false
            data.raw.item["wood"].stack_size = 500
            data.raw.item["wood"].fuel_value = nil
            data.raw.item["small-electric-pole"].fuel_value = nil
            data.raw.item["seedling"].fuel_value = nil
        elseif settings.startup["treeless-map-forced"].value == true then
            for k, _ in pairs(data.raw.tree) do
                data.raw.tree[k].autoplace = nil
            end
            if mods["boblibrary"] then
                bobmods.lib.recipe.replace_ingredient_in_all("wooden-chest", "iron-chest")
            end
            data.raw.recipe["wooden-chest"].enabled = false
            data.raw.item["wood"].stack_size = 500
            data.raw.item["wood"].fuel_value = nil
            data.raw.item["small-electric-pole"].fuel_value = nil
        end
    else
        settings.startup["treeless-map"] = false
        data_string["trees"] = { size = 0.5, richness = 1 }
        data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.ageing = 1
        data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.enemy_attack_pollution_consumption_modifier = 1
        data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.min_pollution_to_damage_trees = 60
        data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.pollution_restored_per_tree_damage = 10
        data.raw["map-gen-presets"].default["project-corona"].advanced_settings.pollution.diffusion_ratio = 0.02 -- Must be <= 0.25.
    end
end

basic_tint = { r = 165, g = 165, b = 165 }
tint = { r = 210, g = 180, b = 80 }
fast_tint = { r = 210, g = 60, b = 60 }
express_tint = { r = 80, g = 180, b = 210 }
turbo_tint = { r = 165, g = 10, b = 225 }
ultimate_tint = { r = 10, g = 225, b = 25 }
filter_tint = { r = 0, g = 0, b = 0 }

require("prototypes.entity.entity-final")
require("prototypes.item.item-final")
require("prototypes.recipe.recipe-final")
require("prototypes.technology.technology-final")
