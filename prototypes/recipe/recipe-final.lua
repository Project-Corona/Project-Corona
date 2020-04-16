if settings.startup["enable-loaderhaul"].value == true then
    if mods["boblogistics"] then
        if data.raw.recipe["transport-belt-beltbox"] then
            data.raw.recipe["basic-transport-belt-beltbox"].ingredients = {
                { "iron-plate", 10 },
                { "iron-gear-wheel", 5 },
                { "burner-inserter", 5 },
            }
            data.raw.recipe["transport-belt-beltbox"].ingredients = {
                { "iron-plate", 10 },
                { "iron-gear-wheel", 5 },
                { "inserter", 10 },
            }
            data.raw.recipe["fast-transport-belt-beltbox"].ingredients = {
                { "steel-plate", 10 },
                { "steel-gear-wheel", 5 },
                { "transport-belt-beltbox", 1 },
                { "long-handed-inserter", 5 },
            }
            data.raw.recipe["express-transport-belt-beltbox"].ingredients = {
                { "fast-transport-belt-beltbox", 1 },
                { "fast-inserter", 5 },
            }
            data.raw.recipe["turbo-transport-belt-beltbox"].ingredients = {
                { "express-transport-belt-beltbox", 1 },
                { "turbo-inserter", 5 },
            }
            data.raw.recipe["ultimate-transport-belt-beltbox"].ingredients = {
                { "turbo-transport-belt-beltbox", 1 },
                { "express-inserter", 5 },
            }
            data.raw.recipe["basic-underground-belt"].ingredients = {
                { "iron-gear-wheel", 10 },
                { "iron-plate", 10 },
            }
            data.raw.recipe["basic-transport-belt-loader"].ingredients = {
                { "burner-inserter", 5 },
                { "iron-gear-wheel", 5 },
                { "iron-plate", 5 },
            }
            data.raw.recipe["miniloader"].ingredients = {
                { "transport-belt", 1 },
                { "inserter", 5 },
            }
            data.raw.recipe["filter-miniloader"].ingredients = {
                { "miniloader", 1 },
                { "electronic-circuit", 5 },
            }
            data.raw.recipe["fast-miniloader"].ingredients = {
                { "fast-transport-belt", 1 },
                { "miniloader", 1 },
                { "long-handed-inserter", 1 },
            }
            data.raw.recipe["fast-filter-miniloader"].ingredients = {
                { "fast-miniloader", 1 },
                { "electronic-circuit", 10 },
            }
            data.raw.recipe["express-miniloader"].ingredients = {
                { "express-transport-belt", 1 },
                { "fast-miniloader", 1 },
                { "fast-inserter", 1 },
            }
            data.raw.recipe["express-filter-miniloader"].ingredients = {
                { "express-miniloader", 1 },
                { "electronic-circuit", 15 },
            }
            data.raw.recipe["turbo-miniloader"].ingredients = {
                { "turbo-transport-belt", 1 },
                { "express-miniloader", 1 },
                { "turbo-inserter", 1 },
            }
            data.raw.recipe["turbo-filter-miniloader"].ingredients = {
                { "turbo-miniloader", 1 },
                { "advanced-circuit", 2 },
            }
            data.raw.recipe["ultimate-miniloader"].ingredients = {
                { "ultimate-transport-belt", 1 },
                { "turbo-miniloader", 1 },
                { "express-inserter", 1 },
            }
            data.raw.recipe["ultimate-filter-miniloader"].ingredients = {
                { "ultimate-miniloader", 1 },
                { "advanced-circuit", 5 },
            }
        else
            data.raw.recipe["basic-underground-belt"].ingredients = {
                { "iron-gear-wheel", 10 },
                { "iron-plate", 10 },
            }
            data.raw.recipe["basic-transport-belt-loader"].ingredients = {
                { "burner-inserter", 5 },
                { "iron-gear-wheel", 5 },
                { "iron-plate", 5 },
            }
            data.raw.recipe["miniloader"].ingredients = {
                { "transport-belt", 1 },
                { "inserter", 5 },
            }
            data.raw.recipe["filter-miniloader"].ingredients = {
                { "miniloader", 1 },
                { "electronic-circuit", 5 },
            }
            data.raw.recipe["fast-miniloader"].ingredients = {
                { "fast-transport-belt", 1 },
                { "miniloader", 1 },
                { "long-handed-inserter", 1 },
            }
            data.raw.recipe["fast-filter-miniloader"].ingredients = {
                { "fast-miniloader", 1 },
                { "electronic-circuit", 10 },
            }
            data.raw.recipe["express-miniloader"].ingredients = {
                { "express-transport-belt", 1 },
                { "fast-miniloader", 1 },
                { "fast-inserter", 1 },
            }
            data.raw.recipe["express-filter-miniloader"].ingredients = {
                { "express-miniloader", 1 },
                { "electronic-circuit", 15 },
            }
            data.raw.recipe["turbo-miniloader"].ingredients = {
                { "turbo-transport-belt", 1 },
                { "express-miniloader", 1 },
                { "turbo-inserter", 1 },
            }
            data.raw.recipe["turbo-filter-miniloader"].ingredients = {
                { "turbo-miniloader", 1 },
                { "advanced-circuit", 2 },
            }
            data.raw.recipe["ultimate-miniloader"].ingredients = {
                { "ultimate-transport-belt", 1 },
                { "turbo-miniloader", 1 },
                { "express-inserter", 1 },
            }
            data.raw.recipe["ultimate-filter-miniloader"].ingredients = {
                { "ultimate-miniloader", 1 },
                { "advanced-circuit", 5 },
            }
        end
    else
        if data.raw.recipe["transport-belt-beltbox"] then
            data.raw.recipe["transport-belt-beltbox"].ingredients = {
                { "iron-plate", 10 },
                { "iron-gear-wheel", 5 },
                { "inserter", 10 },
            }
            data.raw.recipe["fast-transport-belt-beltbox"].ingredients = {
                { "steel-plate", 10 },
                { "steel-gear-wheel", 5 },
                { "transport-belt-beltbox", 1 },
                { "long-handed-inserter", 5 },
            }
            data.raw.recipe["express-transport-belt-beltbox"].ingredients = {
                { "fast-transport-belt-beltbox", 1 },
                { "fast-inserter", 5 },
            }
            data.raw.recipe["miniloader"].ingredients = {
                { "transport-belt", 1 },
                { "inserter", 5 },
            }
            data.raw.recipe["filter-miniloader"].ingredients = {
                { "miniloader", 1 },
                { "electronic-circuit", 5 },
            }
            data.raw.recipe["fast-miniloader"].ingredients = {
                { "fast-transport-belt", 1 },
                { "miniloader", 1 },
                { "long-handed-inserter", 1 },
            }
            data.raw.recipe["fast-filter-miniloader"].ingredients = {
                { "fast-miniloader", 1 },
                { "electronic-circuit", 10 },
            }
            data.raw.recipe["express-miniloader"].ingredients = {
                { "express-transport-belt", 1 },
                { "fast-miniloader", 1 },
                { "fast-inserter", 1 },
            }
            data.raw.recipe["express-filter-miniloader"].ingredients = {
                { "express-miniloader", 1 },
                { "electronic-circuit", 15 },
            }
        else
            data.raw.recipe["miniloader"].ingredients = {
                { "transport-belt", 1 },
                { "inserter", 5 },
            }
            data.raw.recipe["filter-miniloader"].ingredients = {
                { "miniloader", 1 },
                { "electronic-circuit", 5 },
            }
            data.raw.recipe["fast-miniloader"].ingredients = {
                { "fast-transport-belt", 1 },
                { "miniloader", 1 },
                { "long-handed-inserter", 1 },
            }
            data.raw.recipe["fast-filter-miniloader"].ingredients = {
                { "fast-miniloader", 1 },
                { "electronic-circuit", 10 },
            }
            data.raw.recipe["express-miniloader"].ingredients = {
                { "express-transport-belt", 1 },
                { "fast-miniloader", 1 },
                { "fast-inserter", 1 },
            }
            data.raw.recipe["express-filter-miniloader"].ingredients = {
                { "express-miniloader", 1 },
                { "electronic-circuit", 15 },
            }
        end
    end

    if not mods["bobplates"] then
        bobmods.lib.recipe.replace_ingredient("fast-transport-belt-beltbox", "steel-gear-wheel", "iron-gear-wheel")
    end

    if mods["boblogistics"] and mods["deadlock-beltboxes-loaders"] then
        if mods["beltlayer"] then
            data.raw["item-subgroup"]["beltboxes"].group = "bob-logistics"
        else
            data.raw.recipe["transport-belt-beltbox"].subgroup = "bob-logistic-tier-1"
            data.raw.recipe["transport-belt-beltbox"].order = "g"
            data.raw.recipe["fast-transport-belt-beltbox"].subgroup = "bob-logistic-tier-2"
            data.raw.recipe["fast-transport-belt-beltbox"].order = "g"
            data.raw.recipe["express-transport-belt-beltbox"].subgroup = "bob-logistic-tier-3"
            data.raw.recipe["express-transport-belt-beltbox"].order = "g"
            if mods["deadlock-integrations"] then
                data.raw.recipe["basic-transport-belt-beltbox"].subgroup = "bob-logistic-tier-0"
                data.raw.recipe["basic-transport-belt-beltbox"].order = "g"
                data.raw.recipe["turbo-transport-belt-beltbox"].subgroup = "bob-logistic-tier-4"
                data.raw.recipe["turbo-transport-belt-beltbox"].order = "g"
                data.raw.recipe["ultimate-transport-belt-beltbox"].subgroup = "bob-logistic-tier-5"
                data.raw.recipe["ultimate-transport-belt-beltbox"].order = "g"
            end
        end
        if mods["miniloader"] and mods["deadlock-integrations"] then
            data.raw["loader-1x1"]["basic-transport-belt-loader"].localised_description = { "entity-description.basic-deadlock-loader" }
            data.raw.recipe["basic-transport-belt-loader"].localised_description = { "entity-description.basic-deadlock-loader" }
            data.raw.recipe["basic-transport-belt-loader"].subgroup = "bob-logistic-tier-0"
            data.raw.recipe["basic-transport-belt-loader"].order = "f"
        end
    end
end
