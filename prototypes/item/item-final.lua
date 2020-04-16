if settings.startup["enable-loaderhaul"].value == true then
    function createItem(prefix, filter, mask_tint)
        if prefix == nil and filter == false then
            ivar = data.raw.item["miniloader"]
        elseif prefix == nil and filter == true then
            ivar = data.raw.item["filter-miniloader"]
        elseif prefix ~= nil and filter == false then
            ivar = data.raw.item[prefix .. "miniloader"]
        elseif prefix ~= nil and filter == true then
            ivar = data.raw.item[prefix .. "filter-miniloader"]
        end
        local i = ivar
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

    if mods["boblogistics"] then
        function createBasicItem()
            local bi = data.raw.item["basic-transport-belt-loader"]
            bi.type = "item"
            bi.name = "basic-transport-belt-loader"
            bi.technology = "basic-miniloader"
            bi.icon = nil
            bi.icons = {
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-base.png" },
                { icon = "__deadlock-beltboxes-loaders__/graphics/icons/mipmaps/loader-icon-mask.png" }
            }
            bi.icon_size = 64
            bi.place_result = "basic-transport-belt-loader"
            bi.stack_size = 50
            return bi
        end
    end

    local miniloader = createItem(nil, false, tint)
    local filter_miniloader = createItem(nil, true, tint)
    local fast_miniloader = createItem("fast-", false, fast_tint)
    local fast_filter_miniloader = createItem("fast-", true, fast_tint)
    local express_miniloader = createItem("express-", false, express_tint)
    local express_filter_miniloader = createItem("express-", true, express_tint)

    data:extend({
        miniloader,
        filter_miniloader,
        fast_miniloader,
        fast_filter_miniloader,
        express_miniloader,
        express_filter_miniloader,
    })

    if mods["boblogistics"] then
        local basic_miniloader = createBasicItem()
        local turbo_miniloader = createItem("turbo-", false, turbo_tint)
        local turbo_filter_miniloader = createItem("turbo-", true, turbo_tint)
        local ultimate_miniloader = createItem("ultimate-", false, ultimate_tint)
        local ultimate_filter_miniloader = createItem("ultimate-", true, ultimate_tint)
        data:extend({
            basic_miniloader,
            turbo_miniloader,
            turbo_filter_miniloader,
            ultimate_miniloader,
            ultimate_filter_miniloader,
        })
    end
end