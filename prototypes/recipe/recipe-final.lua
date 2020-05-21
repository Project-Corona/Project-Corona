if settings.startup["enable-loaderhaul"].value == true then
    --[[
    local function getBeltboxName()
        if mods["boblogistics"] and mods["deadlock-beltboxes-loaders"] and mods["miniloader"] then
            if settings.startup["deadlock-enable-beltboxes"].value == true then
                if mods["deadlock-integrations"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true then
                    local name = {
                        "basic-transport-belt-beltbox",
                        "transport-belt-beltbox",
                        "fast-transport-belt-beltbox",
                        "express-transport-belt-beltbox",
                        "turbo-transport-belt-beltbox",
                        "ultimate-transport-belt-beltbox",
                    }
                    return name
                elseif mods["deadlock-integrations"] and settings.startup["bobmods-logistics-beltoverhaul"].value == false then
                    local name = {
                        "transport-belt-beltbox",
                        "fast-transport-belt-beltbox",
                        "express-transport-belt-beltbox",
                        "turbo-transport-belt-beltbox",
                        "ultimate-transport-belt-beltbox",
                    }
                    return name
                else
                    local name = {
                        "transport-belt-beltbox",
                        "fast-transport-belt-beltbox",
                        "express-transport-belt-beltbox",
                    }
                    return name
                end
            end
        end
    end

    for _, name in pairs(getBeltboxName()) do
        if data.raw.item[name] then
            data.raw.item[name].icon_size = 64
            data.raw.item[name].icon_mipmaps = 4
        end
    end
--]]
    if mods["boblogistics"] and mods["deadlock-beltboxes-loaders"] then
        if mods["beltlayer"] and settings.startup["deadlock-enable-beltboxes"].value == true then
            data.raw["item-subgroup"]["beltboxes"].group = "bob-logistics"
        elseif not mods["beltlayer"] and settings.startup["deadlock-enable-beltboxes"].value == true then
            data.raw.recipe["transport-belt-beltbox"].subgroup = "bob-logistic-tier-1"
            data.raw.recipe["transport-belt-beltbox"].order = "g"
            data.raw.recipe["fast-transport-belt-beltbox"].subgroup = "bob-logistic-tier-2"
            data.raw.recipe["fast-transport-belt-beltbox"].order = "g"
            data.raw.recipe["express-transport-belt-beltbox"].subgroup = "bob-logistic-tier-3"
            data.raw.recipe["express-transport-belt-beltbox"].order = "g"
            if mods["deadlock-integrations"] then
                if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
                    data.raw.recipe["basic-transport-belt-beltbox"].subgroup = "bob-logistic-tier-0"
                    data.raw.recipe["basic-transport-belt-beltbox"].order = "g"
                end
                data.raw.recipe["turbo-transport-belt-beltbox"].subgroup = "bob-logistic-tier-4"
                data.raw.recipe["turbo-transport-belt-beltbox"].order = "g"
                data.raw.recipe["ultimate-transport-belt-beltbox"].subgroup = "bob-logistic-tier-5"
                data.raw.recipe["ultimate-transport-belt-beltbox"].order = "g"
            end
        end
    end

    if data.raw.item["basic-underground-belt"] then
        data.raw.recipe["basic-underground-belt"].ingredients = { { "iron-gear-wheel", 10 }, { "iron-plate", 10 }, }
    end

    --- Beltboxes
    if data.raw.item["basic-transport-belt-beltbox"] then
        data.raw.recipe["basic-transport-belt-beltbox"].ingredients = { { "iron-plate", 10 }, { "iron-gear-wheel", 5 }, { "burner-inserter", 5 }, }
    end
    if data.raw.item["transport-belt-beltbox"] then
        if data.raw.item["basic-transport-belt-beltbox"] then
            data.raw.recipe["transport-belt-beltbox"].ingredients = { { "basic-transport-belt-beltbox", 1 }, { "iron-plate", 10 }, { "iron-gear-wheel", 5 }, { "inserter", 10 }, }
        else
            data.raw.recipe["transport-belt-beltbox"].ingredients = { { "iron-plate", 10 }, { "iron-gear-wheel", 5 }, { "inserter", 10 }, }
        end
    end
    if data.raw.item["fast-transport-belt-beltbox"] and mods["bobplates"] then
        data.raw.recipe["fast-transport-belt-beltbox"].ingredients = { { "steel-plate", 10 }, { "steel-gear-wheel", 5 }, { "transport-belt-beltbox", 1 }, { "long-handed-inserter", 5 }, }
    elseif data.raw.item["fast-transport-belt-beltbox"] then
        data.raw.recipe["fast-transport-belt-beltbox"].ingredients = { { "steel-plate", 10 }, { "iron-gear-wheel", 5 }, { "transport-belt-beltbox", 1 }, { "long-handed-inserter", 5 }, }
    end
    if data.raw.item["express-transport-belt-beltbox"] then
        data.raw.recipe["express-transport-belt-beltbox"].ingredients = { { "fast-transport-belt-beltbox", 1 }, { "fast-inserter", 5 }, }
    end
    if data.raw.item["turbo-transport-belt-beltbox"] then
        data.raw.recipe["turbo-transport-belt-beltbox"].ingredients = { { "express-transport-belt-beltbox", 1 }, { "turbo-inserter", 5 }, }
    end
    if data.raw.item["ultimate-transport-belt-beltbox"] then
        data.raw.recipe["ultimate-transport-belt-beltbox"].ingredients = { { "turbo-transport-belt-beltbox", 1 }, { "express-inserter", 5 }, }
    end

    --- Loaders
    if data.raw.item["basic-transport-belt-loader"] then
        data.raw.recipe["basic-transport-belt-loader"].ingredients = { { "burner-inserter", 5 }, { "iron-gear-wheel", 5 }, { "iron-plate", 5 }, }
    end
    if data.raw.item["basic-miniloader"] then
        data.raw.recipe["basic-miniloader"].ingredients = { { "burner-inserter", 5 }, { "iron-gear-wheel", 5 }, { "iron-plate", 5 }, }
    end
    if data.raw.item["miniloader"] then
        if data.raw.item["basic-transport-belt-loader"] then
            data.raw.recipe["miniloader"].ingredients = { { "basic-transport-belt-loader", 1 }, { "transport-belt", 1 }, { "inserter", 5 }, }
        elseif data.raw.item["basic-miniloader"] then
            data.raw.recipe["miniloader"].ingredients = { { "basic-miniloader", 1 }, { "transport-belt", 1 }, { "inserter", 5 }, }
        else
            data.raw.recipe["miniloader"].ingredients = { { "transport-belt", 1 }, { "inserter", 5 }, }
        end
    end
    if data.raw.item["filter-miniloader"] then
        data.raw.recipe["filter-miniloader"].ingredients = { { "miniloader", 1 }, { "electronic-circuit", 5 }, }
    end
    if data.raw.item["fast-miniloader"] then
        data.raw.recipe["fast-miniloader"].ingredients = { { "fast-transport-belt", 1 }, { "miniloader", 1 }, { "long-handed-inserter", 1 }, }
    end
    if data.raw.item["fast-filter-miniloader"] then
        data.raw.recipe["fast-filter-miniloader"].ingredients = { { "fast-miniloader", 1 }, { "electronic-circuit", 10 }, }
    end
    if data.raw.item["express-miniloader"] then
        data.raw.recipe["express-miniloader"].ingredients = { { "express-transport-belt", 1 }, { "fast-miniloader", 1 }, { "fast-inserter", 1 }, }
    end
    if data.raw.item["express-filter-miniloader"] then
        data.raw.recipe["express-filter-miniloader"].ingredients = { { "express-miniloader", 1 }, { "electronic-circuit", 15 }, }
    end
    if data.raw.item["turbo-miniloader"] then
        data.raw.recipe["turbo-miniloader"].ingredients = { { "turbo-transport-belt", 1 }, { "express-miniloader", 1 }, { "turbo-inserter", 1 }, }
    end
    if data.raw.item["turbo-filter-miniloader"] then
        data.raw.recipe["turbo-filter-miniloader"].ingredients = { { "turbo-miniloader", 1 }, { "advanced-circuit", 2 }, }
    end
    if data.raw.item["ultimate-miniloader"] then
        data.raw.recipe["ultimate-miniloader"].ingredients = { { "ultimate-transport-belt", 1 }, { "turbo-miniloader", 1 }, { "express-inserter", 1 }, }
    end
    if data.raw.item["ultimate-filter-miniloader"] then
        data.raw.recipe["ultimate-filter-miniloader"].ingredients = { { "ultimate-miniloader", 1 }, { "advanced-circuit", 5 }, }
    end
    if mods["Krastorio2"] and mods["boblibrary"] then
        if data.raw.item["kr-advanced-miniloader"] then
            data.raw.recipe["kr-advanced-miniloader"].ingredients = { { "kr-advanced-transport-belt", 1 }, { "express-miniloader", 1 }, { "stack-inserter", 1 }, }
        end
        if data.raw.item["kr-advanced-filter-miniloader"] then
            data.raw.recipe["kr-advanced-filter-miniloader"].ingredients = { { "kr-advanced-miniloader", 1 }, { "advanced-circuit", 2 }, }
        end
        if data.raw.item["kr-superior-miniloader"] then
            data.raw.recipe["kr-superior-miniloader"].ingredients = { { "kr-superior-transport-belt", 1 }, { "kr-advanced-miniloader", 1 }, { "kr-superior-inserter", 1 }, }
        end
        if data.raw.item["kr-superior-filter-miniloader"] then
            data.raw.recipe["kr-superior-filter-miniloader"].ingredients = { { "kr-superior-miniloader", 1 }, { "advanced-circuit", 5 }, }
        end
        if data.raw.item["kr-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("logistics", "kr-loader")
        end
        if data.raw.item["kr-fast-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("logistics-2", "kr-fast-loader")
        end
        if data.raw.item["kr-express-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("logistics-3", "kr-express-loader")
        end
        if data.raw.item["kr-advanced-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("kr-logistic-4", "kr-advanced-loader")
        end
        if data.raw.item["kr-superior-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("kr-logistic-5", "kr-superior-loader")
        end
        if data.raw.item["kr-space-loader"] then
            bobmods.lib.tech.remove_recipe_unlock("space-platform-scaffold", "space-loader")
        end
    end
end

if mods["beltlayer"] and settings.startup["enable-beltlayer-recipe-tweak"].value == true then
    local function beltlayer_connector_name()
        if mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true then
            local beltlayer_connector = {
                "basic-underground-belt-beltlayer-connector",
                "underground-belt-beltlayer-connector",
                "fast-underground-belt-beltlayer-connector",
                "express-underground-belt-beltlayer-connector",
                "turbo-underground-belt-beltlayer-connector",
                "ultimate-underground-belt-beltlayer-connector",
            }
            return beltlayer_connector
        elseif mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == false then
            local beltlayer_connector = {
                "underground-belt-beltlayer-connector",
                "fast-underground-belt-beltlayer-connector",
                "express-underground-belt-beltlayer-connector",
                "turbo-underground-belt-beltlayer-connector",
                "ultimate-underground-belt-beltlayer-connector",
            }
            return beltlayer_connector
        else
            local beltlayer_connector = {
                "underground-belt-beltlayer-connector",
                "fast-underground-belt-beltlayer-connector",
                "express-underground-belt-beltlayer-connector",
            }
            return beltlayer_connector
        end
    end

    for _, name in pairs(beltlayer_connector_name()) do
        if data.raw["loader-1x1"][name] == "basic-underground-belt-beltlayer-connector" then
            data.raw.recipe[name].ingredients = data.raw.recipe["basic-underground-belt"].ingredients
            data.raw.recipe[name].result_count = 2
        end
        if data.raw["loader-1x1"][name].ingredients then
            for _, ingredient in ipairs(data.raw.recipe[name].ingredients) do
                if ingredient.amount then
                    ingredient.amount = math.ceil(ingredient.amount * 2)
                elseif ingredient[2] then
                    ingredient[2] = math.ceil(ingredient[2] * 2)
                end
            end
            data.raw.recipe[name].result_count = 2
        end
    end
end

--- Personal Changes for a Krastorio + Space Exploration Playthrough
--[[
if mods["Krastorio2"] then
    if mods["beltlayer"] then
        data.raw.recipe["underground-belt-beltlayer-connector"].ingredients = { { "iron-beam", 2 }, { "transport-belt", 5 }, }
        data.raw.recipe["underground-belt-beltlayer-connector"].result_count = 2
        data.raw.recipe["fast-underground-belt-beltlayer-connector"].ingredients = { { "underground-belt", 2 }, { "fast-transport-belt", 10 }, }
        data.raw.recipe["fast-underground-belt-beltlayer-connector"].result_count = 2
        data.raw.recipe["express-underground-belt-beltlayer-connector"].ingredients = { { "fast-underground-belt", 2 }, { "express-transport-belt", 20 }, }
        data.raw.recipe["express-underground-belt-beltlayer-connector"].result_count = 2
        data.raw.recipe["kr-advanced-underground-belt-beltlayer-connector"].ingredients = { { "express-underground-belt", 2 }, { "kr-advanced-transport-belt", 30 }, }
        data.raw.recipe["kr-advanced-underground-belt-beltlayer-connector"].result_count = 2
        data.raw.recipe["kr-superior-underground-belt-beltlayer-connector"].ingredients = { { "kr-advanced-underground-belt", 2 }, { "kr-superior-transport-belt", 40 }, }
        data.raw.recipe["kr-superior-underground-belt-beltlayer-connector"].result_count = 2
    end
    data.raw.recipe["landfill"].result_count = 20
    data.raw.recipe["landfill-2"].result_count = 50

    data.raw.recipe["coal-filtration"].energy_required = 5
    data.raw.recipe["coal-filtration"].ingredients =
    {
        { type = "fluid", name = "heavy-oil", amount = 90 }
    }
    data.raw.recipe["coal-filtration"].results =
    {
        { type = "item", name = "coal", amount = 30 },
        { type = "fluid", name = "water", amount = 40 }
    }
    data.raw.recipe["coal-liquefaction"].ingredients =
    {
        { type = "item", name = "coal", amount = 10 },
        { type = "fluid", name = "heavy-oil", amount = 25 },
        { type = "fluid", name = "steam", amount = 50 },
    }
    data.raw.recipe["coal-liquefaction"].results =
    {
        { type = "fluid", name = "heavy-oil", amount = 55 },
        { type = "fluid", name = "light-oil", amount = 20 },
        { type = "fluid", name = "petroleum-gas", amount = 10 },
    }

    data.raw["equipment-grid"]["small-equipment-grid"].width = 12
    data.raw["equipment-grid"]["small-equipment-grid"].height = 12

    data.raw["equipment-grid"]["medium-equipment-grid"].width = 16
    data.raw["equipment-grid"]["medium-equipment-grid"].height = 16

    data.raw["equipment-grid"]["large-equipment-grid"].width = 20
    data.raw["equipment-grid"]["large-equipment-grid"].height = 20

    data.raw["equipment-grid"]["mk3-armor-grid"].width = 22
    data.raw["equipment-grid"]["mk3-armor-grid"].height = 22

    data.raw["equipment-grid"]["mk4-armor-grid"].width = 24
    data.raw["equipment-grid"]["mk4-armor-grid"].height = 24

    data.raw.lab["kr-singularity-lab"].researching_speed = 3.5

    data.raw.recipe["imersite-powder"].results = {
        { type = "item", name = "imersite-powder", amount = 10 },
    }

    data.raw.recipe["imersium-plate"].result_count = 6
    if mods["space-exploration"] then
        data.raw.recipe["se-space-platform-scaffold"].result_count = 10
        data.raw.recipe["se-space-platform-plating"].result_count = 10
    end
end
--]]