local power_armor =
{
    type = "technology",
    name = "bob-power-armor-6",
    icon = "__project-corona__/graphics/technology/power-armor-mk6.png",
    icon_size = 64,
    prerequisites =
    {
        "bob-power-armor-5",
    },
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "bob-power-armor-mk6"
        }
    },
    unit =
    {
        count = 500,
        ingredients =
        {
            { "automation-science-pack", 1 },
            { "chemical-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "military-science-pack", 1 },
            { "production-science-pack", 1 },
            { "utility-science-pack", 1 }
        },
        time = 30
    },
    order = "g-c-e"
}

if mods["bobwarfare"] then
    data:extend({
        power_armor,
    })
end

data:extend({
    {
        type = "technology",
        name = "big-furnace",
        icon_size = 128,
        icon = "__base__/graphics/technology/advanced-material-processing.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "big-furnace",
            },
        },
        prerequisites = { "advanced-material-processing-2" },
        unit =
        {
            count = 250,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
            },
            time = 30
        },
        order = "c-c-b"
    },
    {
        type = "technology",
        name = "circuit-factory",
        icon_size = 128,
        icon = "__base__/graphics/technology/automation.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "circuit-factory"
            },
            {
                type = "unlock-recipe",
                recipe = "electronic-circuit-factory"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-circuit-factory"
            },
            {
                type = "unlock-recipe",
                recipe = "processing-unit-factory"
            },
        },
        prerequisites = { "automation-3" },
        unit =
        {
            count = 150,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 }
            },
            time = 60
        },
        order = "a-b-c"
    },
})
