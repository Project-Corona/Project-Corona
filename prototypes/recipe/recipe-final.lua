--- Personal Changes for a Krastorio + Space Exploration Play through
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
    if settings.startup["enable-loaderhaul"].value == true then
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
        if mods["boblibrary"] then
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
end
