data.raw.recipe["rail"].ingredients = {
    { "wood", 1 },
    { "stone", 1 },
    { "steel-plate", 1 },
}

if mods["bobplates"] and settings.startup["treeless-map"].value == true then
    bobmods.lib.recipe.replace_ingredient("bob-greenhouse", "glass", "copper-plate")
end

if mods["boblogistics"] then
    bobmods.lib.recipe.replace_ingredient("basic-splitter", "wood", "iron-stick")
end

if settings.startup["enable-loaderhaul"].value == true then
    --- Recipe Organization
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
        data.raw.recipe["miniloader"].ingredients = { { "transport-belt", 1 }, { "inserter", 5 }, }
        if mods["deadlock-integrations"] and mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true and not mods["miniloader"] then
            table.insert(data.raw.recipe["miniloader"].ingredients, { "basic-transport-belt-loader", 1 })
        elseif mods["deadlock-integrations"] and mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true and mods["miniloader"] then
            table.insert(data.raw.recipe["miniloader"].ingredients, { "basic-miniloader", 1 })
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
end

if mods["beltlayer"] and settings.startup["enable-beltlayer-recipe-tweak"].value == true then
    local underground_belt = {
        "basic-underground-belt",
        "underground-belt",
        "fast-underground-belt",
        "express-underground-belt",
        "turbo-underground-belt",
        "ultimate-underground-belt",
    }
    for _, name in pairs(underground_belt) do
        if data.raw.item[name .. "-beltlayer-connector"] then
            data.raw.recipe[name .. "-beltlayer-connector"].ingredients = data.raw.recipe[name].ingredients
            data.raw.recipe[name .. "-beltlayer-connector"].result_count = 2
        end
    end
end
