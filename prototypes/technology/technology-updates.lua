if mods["bobwarfare"] then
    if data.raw.tool["science-pack-gold"] and
            data.raw.tool["alien-science-pack-blue"] and
            data.raw.tool["alien-science-pack-orange"] and
            data.raw.tool["alien-science-pack-purple"] and
            data.raw.tool["alien-science-pack-yellow"] and
            data.raw.tool["alien-science-pack-green"] and
            data.raw.tool["alien-science-pack-red"] then
        data.raw.technology["bob-power-armor-6"].unit.ingredients = {
            { "science-pack-gold", 1 },
            { "production-science-pack", 1 },
            { "utility-science-pack", 1 },
            { "alien-science-pack", 1 },
            { "alien-science-pack-red", 1 },
            { "alien-science-pack-orange", 1 },
            { "alien-science-pack-yellow", 1 },
            { "alien-science-pack-green", 1 },
            { "alien-science-pack-blue", 1 },
            { "alien-science-pack-purple", 1 }
        }
    end
end

if mods["CW-thermal-solar-power"] then
    bobmods.lib.tech.remove_recipe_unlock("CW-thermal-solar-power-2", "CW-recycler")
    bobmods.lib.tech.remove_recipe_unlock("CW-thermal-solar-power-2", "CW-steam-engine-2")
    bobmods.lib.tech.remove_recipe_unlock("CW-thermal-solar-power-3", "CW-steam-engine-3")
    bobmods.lib.tech.remove_recipe_unlock("CW-thermal-solar-power-4", "CW-steam-engine-4")
end
