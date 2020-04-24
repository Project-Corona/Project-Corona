if settings.startup["enable-loaderhaul"].value == true and mods["miniloader"] and mods["deadlock-beltboxes-loaders"] and settings.startup["deadlock-enable-loaders"].value == true then
    local function createPlatform(prefix, filter, mask_tint)
        local function name()
            if prefix == nil and filter == false then
                local name = "miniloader-inserter"
                return name
            elseif prefix == nil and filter == true then
                local name = "filter-miniloader-inserter"
                return name
            elseif prefix ~= nil and filter == false then
                local name = prefix .. "-miniloader-inserter"
                return name
            elseif prefix ~= nil and filter == true then
                local name = prefix .. "-filter-miniloader-inserter"
                return name
            end
        end

        local p = data.raw.inserter[name()]

        if filter == true then
            p.platform_picture = {
                sheets = {
                    {
                        hr_version = {
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                            height = 96,
                            priority = "medium",
                            width = 144,
                            scale = 0.5,
                            shift = { 0.5, 0 },
                        },
                        draw_as_shadow = true,
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                        height = 48,
                        priority = "medium",
                        width = 72,
                        scale = 1,
                        shift = { 0.5, 0 },
                    },
                    {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                    },
                    {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            tint = mask_tint,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                        tint = mask_tint,
                    },
                    {
                        hr_version = {
                            filename = "__project-corona__/graphics/entity/hr-filter-loader-mask.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            tint = filter_tint,
                            shift = { 0, 0 },
                        },
                        filename = "__project-corona__/graphics/entity/filter-loader-mask.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                        tint = filter_tint,
                    },
                }
            }
            p.localised_description = { "entity-description.deadlock-filter-loader" }
        else
            p.platform_picture = {
                sheets = {
                    {
                        hr_version = {
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                            height = 96,
                            priority = "medium",
                            width = 144,
                            scale = 0.5,
                            shift = { 0.5, 0 },
                        },
                        draw_as_shadow = true,
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                        height = 48,
                        priority = "medium",
                        width = 72,
                        scale = 1,
                        shift = { 0.5, 0 },
                    },
                    {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                    },
                    {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            tint = mask_tint,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                        tint = mask_tint,
                    }
                }
            }
            p.localised_description = { "entity-description.deadlock-loader" }
        end
        return p
    end

    local miniloader_platform = createPlatform(nil, false, tint)
    local miniloader_filter_platform = createPlatform(nil, true, tint)
    local fast_miniloader_platform = createPlatform("fast", false, fast_tint)
    local fast_filter_miniloader_platform = createPlatform("fast", true, fast_tint)
    local express_miniloader_platform = createPlatform("express", false, express_tint)
    local express_filter_miniloader_platform = createPlatform("express", true, express_tint)

    local function createStructure(prefix, filter, mask_tint)
        local function name()
            if prefix == nil and filter == false then
                local name = "miniloader-loader"
                return name
            elseif prefix == nil and filter == true then
                local name = "filter-miniloader-loader"
                return name
            elseif prefix ~= nil and filter == false then
                local name = prefix .. "-miniloader-loader"
                return name
            elseif prefix ~= nil and filter == true then
                local name = prefix .. "-filter-miniloader-loader"
                return name
            end
        end

        local s = data.raw["loader-1x1"][name()]

        if filter == true then
            s.structure = {
                back_patch = {
                    sheet = {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-back.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-back.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                    },
                },
                direction_in = {
                    sheets = {
                        {
                            hr_version = {
                                draw_as_shadow = true,
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                                height = 96,
                                priority = "medium",
                                width = 144,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                            },
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                            height = 48,
                            priority = "medium",
                            width = 72,
                            scale = 1,
                            shift = { 0.5, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                tint = mask_tint,
                                shift = { 0, 0 },
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = mask_tint,
                        },
                        {
                            hr_version = {
                                filename = "__project-corona__/graphics/entity/hr-filter-loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                tint = filter_tint,
                            },
                            filename = "__project-corona__/graphics/entity/filter-loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = filter_tint,
                        },
                    },
                },
                direction_out = {
                    sheets = {
                        {
                            hr_version = {
                                draw_as_shadow = true,
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                                height = 96,
                                priority = "medium",
                                width = 144,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                            },
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                            height = 48,
                            priority = "medium",
                            width = 72,
                            scale = 1,
                            shift = { 0.5, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                y = 96,
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            y = 48,
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                tint = mask_tint,
                                y = 96
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = mask_tint,
                            y = 48
                        },
                        {
                            hr_version = {
                                filename = "__project-corona__/graphics/entity/hr-filter-loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                tint = filter_tint,
                                y = 96
                            },
                            filename = "__project-corona__/graphics/entity/filter-loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = filter_tint,
                            y = 48
                        },
                    }
                }
            }
            s.localised_description = { "entity-description.deadlock-filter-loader" }
        else
            s.structure = {
                back_patch = {
                    sheet = {
                        hr_version = {
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-back.png",
                            height = 96,
                            priority = "extra-high",
                            width = 96,
                            scale = 0.5,
                            shift = { 0, 0 },
                        },
                        filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-back.png",
                        height = 48,
                        priority = "extra-high",
                        width = 48,
                        scale = 1,
                        shift = { 0, 0 },
                    },
                },
                direction_in = {
                    sheets = {
                        {
                            hr_version = {
                                draw_as_shadow = true,
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                                height = 96,
                                priority = "medium",
                                width = 144,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                            },
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                            height = 48,
                            priority = "medium",
                            width = 72,
                            scale = 1,
                            shift = { 0.5, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                tint = mask_tint,
                                shift = { 0, 0 },
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = mask_tint,
                        },
                    },
                },
                direction_out = {
                    sheets = {
                        {
                            hr_version = {
                                draw_as_shadow = true,
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-shadow.png",
                                height = 96,
                                priority = "medium",
                                width = 144,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                            },
                            draw_as_shadow = true,
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-shadow.png",
                            height = 48,
                            priority = "medium",
                            width = 72,
                            scale = 1,
                            shift = { 0.5, 0 },
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-base.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                y = 96,
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-base.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            y = 48
                        },
                        {
                            hr_version = {
                                filename = "__deadlock-beltboxes-loaders__/graphics/entities/high/loader-mask.png",
                                height = 96,
                                priority = "extra-high",
                                width = 96,
                                scale = 0.5,
                                shift = { 0, 0 },
                                tint = mask_tint,
                                y = 96
                            },
                            filename = "__deadlock-beltboxes-loaders__/graphics/entities/low/loader-mask.png",
                            height = 48,
                            priority = "extra-high",
                            width = 48,
                            scale = 1,
                            shift = { 0, 0 },
                            tint = mask_tint,
                            y = 48
                        },
                    },
                }
            }
            s.localised_description = { "entity-description.deadlock-loader" }
        end
        return s
    end

    local miniloader_structure = createStructure(nil, false, tint)
    local miniloader_filter_structure = createStructure(nil, true, tint)
    local fast_miniloader_structure = createStructure("fast", false, fast_tint)
    local fast_filter_miniloader_structure = createStructure("fast", true, fast_tint)
    local express_miniloader_structure = createStructure("express", false, express_tint)
    local express_filter_miniloader_structure = createStructure("express", true, express_tint)

    data:extend({
        miniloader_platform,
        miniloader_filter_platform,
        fast_miniloader_platform,
        fast_filter_miniloader_platform,
        express_miniloader_platform,
        express_filter_miniloader_platform,
        miniloader_structure,
        miniloader_filter_structure,
        fast_miniloader_structure,
        fast_filter_miniloader_structure,
        express_miniloader_structure,
        express_filter_miniloader_structure,
    })

    if mods["boblogistics"] and mods["deadlock-integrations"] then
        if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
            local basic_miniloader_platform = createPlatform("basic", false, basic_tint)
            local basic_miniloader_structure = createStructure("basic", false, basic_tint)
            data:extend({
                basic_miniloader_platform,
                basic_miniloader_structure,
            })
        end
        local turbo_miniloader_platform = createPlatform("turbo", false, turbo_tint)
        local turbo_filter_miniloader_platform = createPlatform("turbo", true, turbo_tint)
        local ultimate_miniloader_platform = createPlatform("ultimate", false, ultimate_tint)
        local ultimate_filter_miniloader_platform = createPlatform("ultimate", true, ultimate_tint)

        local turbo_miniloader_structure = createStructure("turbo", false, turbo_tint)
        local turbo_filter_miniloader_structure = createStructure("turbo", true, turbo_tint)
        local ultimate_miniloader_structure = createStructure("ultimate", false, ultimate_tint)
        local ultimate_filter_miniloader_structure = createStructure("ultimate", true, ultimate_tint)

        data:extend({
            turbo_miniloader_platform,
            turbo_filter_miniloader_platform,
            ultimate_miniloader_platform,
            ultimate_filter_miniloader_platform,
            turbo_miniloader_structure,
            turbo_filter_miniloader_structure,
            ultimate_miniloader_structure,
            ultimate_filter_miniloader_structure,
        })
    end
end
