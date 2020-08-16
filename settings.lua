data:extend({
    {
        type = "bool-setting",
        name = "enable-big-furnace",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-circuit-factory",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-loaderhaul",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-power-armor-mk6",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-project-corona-map-manipulation",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "treeless-map",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "treeless-map-forced",
        setting_type = "startup",
        default_value = false,
    },
    {
        type = "bool-setting",
        name = "waterless-map",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "waterless-map-forced",
        setting_type = "startup",
        default_value = false,
    },
    {
        type = "bool-setting",
        name = "enable-dev-tools",
        setting_type = "startup",
        default_value = false,
        hidden = true,
    },
})

local function default_value_check()
    local default_value = 1
    if mods["bobenemies"] then
        return default_value + 0.5
    end
    return default_value
end

data:extend({
    {
        type = "double-setting",
        name = "pc-starting-area",
        setting_type = "startup",
        default_value = default_value_check(),
    },
})

if mods["beltlayer"] then
    data:extend({
        {
            type = "bool-setting",
            name = "enable-beltlayer-recipe-tweak",
            setting_type = "startup",
            default_value = true,
        },
    })
end

if mods["boblogistics"] then
    data:extend({
        {
            type = "bool-setting",
            name = "bobmods-logistics-beltoverhaul",
            setting_type = "startup",
            default_value = true,
        },
    })
end

if mods["bobmining"] then
    data:extend({
        {
            type = "bool-setting",
            name = "bobmods-mining-waterminers",
            setting_type = "startup",
            default_value = false,
            hidden = true,
        },
    })
end

if mods["bobplates"] then
    data:extend({
        {
            type = "bool-setting",
            name = "bobmods-plates-groundwater",
            setting_type = "startup",
            default_value = false,
            hidden = true,
        },
    })
end

local function omnimatter_hide_check()
    if mods["omnimatter"] then
        return true
    else
        return false
    end
end

if mods["bobores"] then
    data:extend({
        {
            type = "bool-setting",
            name = "bobmods-ores-infiniteore",
            setting_type = "startup",
            default_value = false,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-unsortedgemore",
            setting_type = "startup",
            default_value = false,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-leadgivesnickel",
            setting_type = "startup",
            default_value = false,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "double-setting",
            name = "bobmods-ores-leadnickelratio",
            setting_type = "startup",
            default_value = 0.6,
            maximum_value = 1,
            minimum_value = 0,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-nickelgivescobalt",
            setting_type = "startup",
            default_value = false,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "double-setting",
            name = "bobmods-ores-nickelcobaltratio",
            setting_type = "startup",
            default_value = 0.4,
            maximum_value = 1,
            minimum_value = 0,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-gemsfromotherores",
            setting_type = "startup",
            default_value = false,
            hidden = omnimatter_hide_check(),
        },
        {
            type = "double-setting",
            name = "bobmods-ores-gemprobability",
            setting_type = "startup",
            default_value = 0.05,
            maximum_value = 1,
            minimum_value = 0,
            hidden = omnimatter_hide_check(),
        },

        {
            type = "bool-setting",
            name = "bobmods-ores-enablebauxite",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablecobaltore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablegemsore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablegoldore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enableleadore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablenickelore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablequartz",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablerutile",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablesilverore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablesulfur",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enabletinore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enabletungstenore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablezincore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablethoriumore",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "bobmods-ores-enablewaterores",
            setting_type = "startup",
            default_value = false,
            hidden = true,
        },
    })
end

if mods["deadlock-beltboxes-loaders"] then
    data:extend({
        {
            type = "bool-setting",
            name = "deadlock-enable-beltboxes",
            order = "a",
            setting_type = "startup",
            default_value = true,
        },
        {
            type = "bool-setting",
            name = "deadlock-enable-loaders",
            order = "b",
            setting_type = "startup",
            default_value = true,
        },
    })
end

if mods["deadlock-integrations"] then
    data:extend({
        {
            type = "bool-setting",
            name = "deadlock-integrations-new-bob-recipes",
            order = "a",
            setting_type = "startup",
            default_value = false,
            hidden = true,
        }
    })
end

local function rso_check()
    if mods["rso-mod"] then
        return true
    else
        return false
    end
end

if mods["omnimatter"] then
    data:extend({
        {
            type = "bool-setting",
            name = "omnimatter-infinite",
            setting_type = "startup",
            default_value = rso_check(),
        },
    })
end

if mods["miniloader"] then
    data:extend({
        {
            type = "bool-setting",
            name = "miniloader-enable-chute",
            setting_type = "startup",
            default_value = false,
            hidden = true,
        },
    })
end
