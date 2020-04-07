if mods["bobwarfare"] then
    if data.raw.item["advanced-processing-unit"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "advanced-circuit", "advanced-processing-unit")
    end

    if mods["bobenemies"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "iron-gear-wheel", { "alien-artifact-red", 50 })
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "iron-plate", { "alien-artifact-orange", 50 })
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "steel-plate", { "alien-artifact-yellow", 50 })
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "plastic-bar", { "alien-artifact-green", 50 })
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "effectivity-module-3", { "alien-artifact-blue", 50 })
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "speed-module-3", { "alien-artifact-purple", 50 })
        bobmods.lib.recipe.remove_ingredient("bob-power-armor-mk6", "productivity-module-3")
    elseif data.raw.item["alien-artifact"] then
        bobmods.lib.recipe.add_new_ingredient("bob-power-armor-mk6", { "alien-artifact", 500 })
    else
        bobmods.lib.recipe.add_ingredient("bob-power-armor-mk6", { "processing-unit", 200 })
    end

    if data.raw.module["effectivity-module-8"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "effectivity-module-3", "effectivity-module-8")
        if mods["bobenemies"] then
            bobmods.lib.recipe.remove_ingredient("bob-power-armor-mk6", "effectivity-module-8")
        end
    end

    if data.raw.module["speed-module-8"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "speed-module-3", "speed-module-8")
        if mods["bobenemies"] then
            bobmods.lib.recipe.remove_ingredient("bob-power-armor-mk6", "speed-module-8")
        end
    end

    if data.raw.module["productivity-module-8"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "productivity-module-3", "productivity-module-8")
        if mods["bobenemies"] then
            bobmods.lib.recipe.remove_ingredient("bob-power-armor-mk6", "productivity-module-8")
        end
    end

    if data.raw.module["productivity-module-8"] then
        bobmods.lib.recipe.replace_ingredient("bob-power-armor-mk6", "productivity-module-3", "productivity-module-8")
        if mods["bobenemies"] then
            bobmods.lib.recipe.remove_ingredient("bob-power-armor-mk6", "productivity-module-8")
        end
    end
end
