if settings.startup["enable-loaderhaul"].value == true and mods["miniloader"] and mods["deadlock-beltboxes-loaders"] and settings.startup["deadlock-enable-loaders"].value == true then
    local function createItem(prefix, filter, mask_tint)
        local function name()
            if prefix == nil and filter == false then
                local name = "miniloader"
                return name
            elseif prefix == nil and filter == true then
                local name = "filter-miniloader"
                return name
            elseif prefix ~= nil and filter == false then
                local name = prefix .. "-miniloader"
                return name
            elseif prefix ~= nil and filter == true then
                local name = prefix .. "-filter-miniloader"
                return name
            end
        end

        local i = data.raw.item[name()]

        if filter == true then
            i.icons = {
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-base.png" },
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-mask.png", tint = mask_tint },
                { icon = "__project-corona__/graphics/icons/filter-loader-icon-mask.png", tint = filter_tint },
            }
            i.localised_description = { "entity-description.deadlock-filter-loader" }
        else
            i.icons = {
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-base.png" },
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-mask.png", tint = mask_tint }
            }
            i.localised_description = { "entity-description.deadlock-loader" }
        end
        i.icon_size = 64
        return i
    end

    local miniloader = createItem(nil, false, tint)
    local filter_miniloader = createItem(nil, true, tint)
    local fast_miniloader = createItem("fast", false, fast_tint)
    local fast_filter_miniloader = createItem("fast", true, fast_tint)
    local express_miniloader = createItem("express", false, express_tint)
    local express_filter_miniloader = createItem("express", true, express_tint)

    data:extend({
        miniloader,
        filter_miniloader,
        fast_miniloader,
        fast_filter_miniloader,
        express_miniloader,
        express_filter_miniloader,
    })

    if mods["boblogistics"] and mods["deadlock-integrations"] then
        if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
            local basic_miniloader = createItem("basic", false, basic_tint)
            data:extend({
                basic_miniloader,
            })
        end
        local turbo_miniloader = createItem("turbo", false, turbo_tint)
        local turbo_filter_miniloader = createItem("turbo", true, turbo_tint)
        local ultimate_miniloader = createItem("ultimate", false, ultimate_tint)
        local ultimate_filter_miniloader = createItem("ultimate", true, ultimate_tint)
        data:extend({
            turbo_miniloader,
            turbo_filter_miniloader,
            ultimate_miniloader,
            ultimate_filter_miniloader,
        })
    end
end
