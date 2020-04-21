if settings.startup["enable-loaderhaul"].value == true then
    if mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true then
        data.raw.technology["basic-transport-belt-loader"] = {
            type = "technology",
            name = "basic-transport-belt-loader",
            icon_size = 128,
            icons = {
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-base-128.png" },
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-mask-128.png", tint = basic_tint }
            },
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "basic-transport-belt-loader",
                },
            },
            unit = {
                count = 10,
                ingredients = {
                    { "automation-science-pack", 1 },
                },
                time = 10
            },
            prerequisites = {
                "logistics-0",
            }
        }
    end

    function newTech(prefix, tint)
        if prefix == nil then
            nvar = data.raw.technology["miniloader"]
        else
            nvar = data.raw.technology[prefix .. "-miniloader"]
        end
        local t = nvar
        if prefix == "fast" then
            t.unit = {
                count = 400,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 },
                },
                time = 30
            }
            t.prerequisites = {
                "miniloader",
                "logistics-2",
            }
        end
        if mods["bob-logistics"] then
            if prefix == nil then
                t.prerequisites = {
                    "basic-miniloader",
                    "logistics",
                }
            end
        else
            if prefix == nil then
                t.prerequisites = {
                    "logistics",
                }
            end
        end
        if prefix == "express" then
            t.prerequisites = {
                "production-science-pack",
                "fast-miniloader",
                "logistics-3",
            }
        end
        t.icon_size = 128
        t.icons = {
            { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-base-128.png" },
            { icon = "__deadlock-beltboxes-loaders__/graphics/icons/square/loader-icon-mask-128.png", tint = tint }
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
        local turbo_miniloader = newTech("turbo", turbo_tint)
        local ultimate_miniloader = newTech("ultimate", ultimate_tint)
        data:extend({
            turbo_miniloader,
            ultimate_miniloader,
        })
    end

    if mods["boblogistics"] and mods["deadlock-beltboxes-loaders"] and mods["miniloader"] then
        bobmods.lib.tech.add_prerequisite("deadlock-stacking-3", "production-science-pack")
        bobmods.lib.tech.remove_recipe_unlock("logistics", "transport-belt-loader")
        bobmods.lib.tech.remove_recipe_unlock("logistics-2", "fast-transport-belt-loader")
        bobmods.lib.tech.remove_recipe_unlock("logistics-3", "express-transport-belt-loader")
        data.raw.technology["basic-miniloader"] = nil
    end

    if mods["boblogistics"] and mods["deadlock-integrations"] and mods["miniloader"] then
        if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
            bobmods.lib.tech.add_prerequisite("miniloader", "basic-transport-belt-loader")
            bobmods.lib.tech.remove_recipe_unlock("logistics-0", "basic-transport-belt-loader")
        end
        bobmods.lib.tech.remove_recipe_unlock("logistics-4", "turbo-transport-belt-loader")
        bobmods.lib.tech.remove_recipe_unlock("logistics-5", "ultimate-transport-belt-loader")
    end
end
