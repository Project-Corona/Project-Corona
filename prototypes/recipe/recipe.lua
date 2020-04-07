local power_armor =
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

if mods["bobwarfare"] then
    data:extend({
        power_armor,
    })
end

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

function createRecipe(recipe_name, energy, recipe_ingredient, cost, result)
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

local big_steel = createRecipe("steel-plate", 17.5, "iron-plate", 50, 50)
local big_copper = createRecipe("copper-plate", 3.5, "copper-ore", 50, 50)
local big_iron = createRecipe("iron-plate", 3.5, "iron-ore", 50, 50)
local big_stone_brick = createRecipe("stone-brick", 3.5, "stone", 50, 25)
local big_tin = createRecipe("tin-plate", 3.5, "tin-ore", 50, 50)
local big_lead = createRecipe("lead-plate", 3.5, "lead-ore", 50, 50)
local big_silver = createRecipe("silver-plate", 3.5, "silver-ore", 50, 50)
local big_glass = createRecipe("glass", 3.5, "quartz", 50, 50)

if mods["bobplates"] then
    data:extend({
        big_steel,
        big_copper,
        big_iron,
        big_stone_brick,
        big_tin,
        big_lead,
        big_silver,
        big_glass,
    })
else
    data:extend({
        big_steel,
        big_copper,
        big_iron,
        big_stone_brick,
    })
end
