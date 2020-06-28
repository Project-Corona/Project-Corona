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
                },
                result = "bob-power-armor-mk6"
            }
        })
    end
end

if settings.startup["enable-power-armor-mk6"].value == true then
    if mods["bobwarfare"] then
        if data.raw.item["advanced-processing-unit"] then
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "advanced-processing-unit", 200 })
        else
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "processing-unit", 100 })
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "advanced-circuit", 200 })
        end
        if mods["bobenemies"] then
            if settings.startup["bobmods-enemies-enablenewartifacts"].value == true then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-blue", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-green", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-orange", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-purple", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-red", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact-yellow", 50 })
            elseif settings.startup["bobmods-enemies-enableartifacts"].value == true and settings.startup["bobmods-enemies-enablenewartifacts"].value == false then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "alien-artifact", 500 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-gear-wheel", 250 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-plate", 500 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "steel-plate", 50 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "plastic-bar", 50 })
            elseif settings.startup["bobmods-enemies-enableartifacts"].value == false and settings.startup["bobmods-enemies-enablenewartifacts"].value == false then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-gear-wheel", 500 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-plate", 1000 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "steel-plate", 100 })
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "plastic-bar", 100 })
                if data.raw.module["effectivity-module-8"] then
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "effectivity-module-8", 5 })
                else
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "effectivity-module-3", 5 })
                end
                if data.raw.module["productivity-module-8"] then
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "productivity-module-8", 5 })
                else
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "productivity-module-3", 5 })
                end
                if data.raw.module["speed-module-8"] then
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "speed-module-8", 5 })
                else
                    table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "speed-module-3", 5 })
                end
            end
        else
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-gear-wheel", 500 })
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "iron-plate", 1000 })
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "steel-plate", 100 })
            table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "plastic-bar", 100 })
            if data.raw.module["effectivity-module-8"] then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "effectivity-module-8", 5 })
            else
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "effectivity-module-3", 5 })
            end
            if data.raw.module["productivity-module-8"] then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "productivity-module-8", 5 })
            else
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "productivity-module-3", 5 })
            end
            if data.raw.module["speed-module-8"] then
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "speed-module-8", 5 })
            else
                table.insert(data.raw.recipe["bob-power-armor-mk6"].ingredients, { "speed-module-3", 5 })
            end
        end
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

    local function createBigRecipe(recipe_name, energy, recipe_ingredient, cost, result)
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
    local kr_big_glass = createBigRecipe("glass", 10, "sand", 100, 50)
    local kr_big_rare_metals = createBigRecipe("rare-metals", 10, "raw-rare-metals", 100, 50)

    data:extend({
        big_steel,
        big_copper,
        big_iron,
        big_stone_brick,
    })

    if mods["Krastorio2"] then
        data:extend({
            kr_big_glass,
            kr_big_rare_metals,
        })
    end

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
