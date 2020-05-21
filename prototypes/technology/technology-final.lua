if settings.startup["enable-loaderhaul"].value == true then
    if mods["miniloader"] and mods["deadlock-beltboxes-loaders"] and settings.startup["deadlock-enable-loaders"].value == true then
        local function newTech(prefix, mask_tint)
            local function name()
                if prefix == nil then
                    local name = "miniloader"
                    return name
                else
                    local name = prefix .. "-miniloader"
                    return name
                end
            end

            local t = data.raw.technology[name()]

            if prefix == "fast" then
                t.unit = {
                    count = 400,
                    ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, },
                    time = 30
                }
                t.prerequisites = { "miniloader", "logistics-2", }
            end
            if mods["bob-logistics"] then
                if prefix == nil and settings.startup["bobmods-logistics-beltoverhaul"].value == true then
                    t.prerequisites = { "basic-transport-belt-loader", "logistics", }
                else
                    t.prerequisites = { "logistics", }
                end
                if prefix == "express" then
                    t.prerequisites = { "production-science-pack", "fast-miniloader", "logistics-3", }
                end
            end
            t.icon_size = 128
            t.icons = {
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-base-128.png" },
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-mask-128.png", tint = mask_tint }
            }
            return t
        end

        local miniloader = newTech(nil, tint)
        local fast_miniloader = newTech("fast", fast_tint)
        local express_miniloader = newTech("express", express_tint)

        data:extend({
            miniloader,
            fast_miniloader,
            express_miniloader,
        })
        if mods["boblogistics"] then
            if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
                local basic_miniloader = newTech("basic", basic_tint)
                data:extend({
                    basic_miniloader,
                })
            end
            local turbo_miniloader = newTech("turbo", turbo_tint)
            local ultimate_miniloader = newTech("ultimate", ultimate_tint)
            data:extend({
                turbo_miniloader,
                ultimate_miniloader,
            })
        end
        if mods["boblibrary"] then
            bobmods.lib.tech.add_prerequisite("express-miniloader", "production-science-pack")
            bobmods.lib.tech.remove_recipe_unlock("logistics", "transport-belt-loader")
            bobmods.lib.tech.remove_recipe_unlock("logistics-2", "fast-transport-belt-loader")
            bobmods.lib.tech.remove_recipe_unlock("logistics-3", "express-transport-belt-loader")
        end
        if mods["boblogistics"] and mods["deadlock-integrations"] then
            if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
                bobmods.lib.tech.add_prerequisite("miniloader", "basic-transport-belt-loader")
                bobmods.lib.tech.remove_recipe_unlock("logistics-0", "basic-transport-belt-loader")
            end
            bobmods.lib.tech.replace_prerequisite("miniloader", "fast-inserter", "logistics")
            bobmods.lib.tech.remove_recipe_unlock("logistics-4", "turbo-transport-belt-loader")
            bobmods.lib.tech.remove_recipe_unlock("logistics-5", "ultimate-transport-belt-loader")
        end
    elseif mods["miniloader"] then
        if not mods["deadlock-beltboxes-loaders"] or settings.startup["deadlock-enable-loaders"].value == false then
            if mods["boblogistics"] then
                bobmods.lib.tech.replace_prerequisite("miniloader", "fast-inserter", "logistics")
                bobmods.lib.tech.add_prerequisite("fast-miniloader", "logistics-2")
                bobmods.lib.tech.add_prerequisite("express-miniloader", "production-science-pack")
            elseif mods["boblibrary"] and not mods["boblogistics"] then
                bobmods.lib.tech.remove_prerequisite("miniloader", "fast-inserter")
            end
        end
    end
    if data.raw.technology["deadlock-stacking-3"] and mods["boblibrary"] then
        bobmods.lib.tech.add_prerequisite("deadlock-stacking-3", "production-science-pack")
    end
end
