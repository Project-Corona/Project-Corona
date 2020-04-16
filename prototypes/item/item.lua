if settings.startup["enable-power-armor-mk6"].value == true then
    if mods["bobwarfare"] then
        data:extend({
            {
                type = "armor",
                name = "bob-power-armor-mk6",
                icon = "__project-corona__/graphics/icons/power-armor-mk6.png",
                icon_size = 32,
                resistances =
                {
                    { type = "physical", decrease = 20, percent = 80 },
                    { type = "acid", decrease = 20, percent = 80 },
                    { type = "explosion", decrease = 20, percent = 80 },
                    { type = "impact", decrease = 20, percent = 80 },
                    { type = "poison", decrease = 20, percent = 80 },
                    { type = "fire", decrease = 20, percent = 80 },
                    { type = "laser", decrease = 20, percent = 80 },
                    { type = "electric", decrease = 20, percent = 80 },
                    { type = "bob-pierce", decrease = 20, percent = 80 },
                    { type = "plasma", percent = 100 },
                },
                subgroup = "armor",
                infinite = true,
                order = "i[power-armor-mk6]",
                stack_size = 1,
                equipment_grid = "power-armor-equipment-grid-mk6",
                inventory_size_bonus = 100
            },
            {
                type = "equipment-grid",
                name = "power-armor-equipment-grid-mk6",
                width = 30,
                height = 60,
                equipment_categories = { "armor" }
            },
        })
    end
end

if settings.startup["enable-big-furnace"].value == true then
    data:extend({
        {
            type = "item",
            name = "big-furnace",
            icon = "__project-corona__/graphics/icons/big-furnace.png",
            icon_size = 32,
            subgroup = "smelting-machine",
            order = "d[big-furnace]",
            place_result = "big-furnace",
            stack_size = 50
        },
    })
end

if settings.startup["enable-circuit-factory"].value == true then
    data:extend({
        {
            type = "item",
            name = "circuit-factory",
            icon = "__project-corona__/graphics/icons/circuitfactory.png",
            icon_size = 32,
            subgroup = "production-machine",
            order = "c[big-assembling-machine]",
            place_result = "circuit-factory",
            stack_size = 50
        },
    })
end
