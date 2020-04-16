data:extend({
    {
        type = "bool-setting",
        name = "treeless-map",
        setting_type = "startup",
        default_value = true,
    },
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
})

if mods["omnimatter"] then
    data:extend({
        {
            type = "bool-setting",
            name = "omnimatter-infinite",
            setting_type = "startup",
            default_value = true,
        },
    })
end

if mods["bobores"] then
    data:extend({
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
        },
    })
end
