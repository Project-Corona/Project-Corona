if settings.startup["enable-power-armor-mk6"].value == true then
    if mods["bobwarfare"] then
        data:extend({
            {
                type = "recipe",
                name = "bob-power-armor-mk6",
                enabled = false,
                energy_required = 30,
                ingredients =
                {
                    { "bob-power-armor-mk5", 1 },
                    { "processing-unit", 100 },
                    { "advanced-circuit", 200 },
                    { "iron-plate", 1000 },
                    { "iron-gear-wheel", 500 },
                    { "steel-plate", 100 },
                    { "plastic-bar", 100 },
                    { "effectivity-module-3", 5 },
                    { "speed-module-3", 5 },
                    { "productivity-module-3", 5 },
                },
                result = "bob-power-armor-mk6"
            }
        })
    end
end

if settings.startup["enable-big-furnace"].value == true then
    data:extend({
        {
            type = "recipe",
            name = "big-furnace",
            ingredients = { { "steel-plate", 10 }, { "advanced-circuit", 50 }, { "electric-furnace", 20 } },
            result = "big-furnace",
            energy_required = 50,
            enabled = false
        },
        {
            type = "recipe-category",
            name = "big-smelting",
        },
    })

    function createBigRecipe(recipe_name, energy, recipe_ingredient, cost, result)
        local recipe = {
            type = "recipe",
            name = "big-" .. recipe_name,
            category = "big-smelting",
            energy_required = energy,
            ingredients = { { recipe_ingredient, cost } },
            result = recipe_name,
            result_count = result,
        }
        return recipe
    end

    local big_steel = createBigRecipe("steel-plate", 17.5, "iron-plate", 50, 50)
    local big_copper = createBigRecipe("copper-plate", 3.5, "copper-ore", 50, 50)
    local big_iron = createBigRecipe("iron-plate", 3.5, "iron-ore", 50, 50)
    local big_stone_brick = createBigRecipe("stone-brick", 3.5, "stone", 50, 25)
    local big_tin = createBigRecipe("tin-plate", 3.5, "tin-ore", 50, 50)
    local big_lead = createBigRecipe("lead-plate", 3.5, "lead-ore", 50, 50)
    local big_silver = createBigRecipe("silver-plate", 3.5, "silver-ore", 50, 50)
    local big_glass = createBigRecipe("glass", 3.5, "quartz", 50, 50)

    data:extend({
        big_steel,
        big_copper,
        big_iron,
        big_stone_brick,
    })

    if mods["bobplates"] then
        data:extend({
            big_tin,
            big_lead,
            big_silver,
            big_glass,
        })
    end
end

if settings.startup["enable-circuit-factory"].value == true then
    data:extend({
        {
            type = "recipe",
            name = "circuit-factory",
            enabled = false,
            ingredients =
            {
                { "speed-module-3", 5 },
                { "assembling-machine-3", 5 },
                { "stack-inserter", 20 }
            },
            result = "circuit-factory"
        },
        {
            type = "recipe",
            name = "electronic-circuit-factory",
            category = "circuits",
            normal =
            {
                ingredients =
                {
                    { "iron-plate", 100 },
                    { "copper-plate", 150 }
                },
                enabled = false,
                result = "electronic-circuit",
                result_count = 100
            },
            expensive =
            {
                ingredients =
                {
                    { "iron-plate", 200 },
                    { "copper-plate", 500 }
                },
                enabled = false,
                result = "electronic-circuit",
                result_count = 100
            }
        },
        {
            type = "recipe",
            name = "advanced-circuit-factory",
            category = "circuits",
            normal =
            {
                enabled = false,
                energy_required = 6,
                ingredients =
                {
                    { "electronic-circuit", 100 },
                    { "plastic-bar", 100 },
                    { "copper-plate", 100 }
                },
                result = "advanced-circuit",
                result_count = 50
            },
            expensive =
            {
                enabled = false,
                energy_required = 6,
                ingredients =
                {
                    { "electronic-circuit", 100 },
                    { "plastic-bar", 200 },
                    { "copper-plate", 200 }
                },
                result = "advanced-circuit",
                result_count = 50
            }
        },
        {
            type = "recipe",
            name = "processing-unit-factory",
            category = "circuits",
            normal =
            {
                enabled = false,
                energy_required = 10,
                ingredients =
                {
                    { "electronic-circuit", 1000 },
                    { "advanced-circuit", 100 },
                    { type = "fluid", name = "sulfuric-acid", amount = 250 }
                },
                result = "processing-unit",
                result_count = 50
            },
            expensive =
            {
                enabled = false,
                energy_required = 10,
                ingredients =
                {
                    { "electronic-circuit", 1000 },
                    { "advanced-circuit", 100 },
                    { type = "fluid", name = "sulfuric-acid", amount = 500 }
                },
                result = "processing-unit",
                result_count = 50
            }
        },
        {
            type = "recipe-category",
            name = "circuits"
        },
    })
end
