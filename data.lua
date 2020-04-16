basic_tint = { r = 165, g = 165, b = 165 }
tint = { r = 210, g = 180, b = 80 }
fast_tint = { r = 210, g = 60, b = 60 }
express_tint = { r = 80, g = 180, b = 210 }
turbo_tint = { r = 165, g = 10, b = 225 }
ultimate_tint = { r = 10, g = 225, b = 25 }
filter_tint = { r = 0, g = 0, b = 0 }

require("prototypes.recipe.recipe")
require("prototypes.technology.technology")
require("prototypes.entity.entity")
require("prototypes.item.item")

if settings.startup["enable-big-furnace"].value == true then
    table.insert(data.raw["module"]["productivity-module"].limitation, "big-iron-plate")
    table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-iron-plate")
    table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-iron-plate")

    table.insert(data.raw["module"]["productivity-module"].limitation, "big-copper-plate")
    table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-copper-plate")
    table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-copper-plate")

    table.insert(data.raw["module"]["productivity-module"].limitation, "big-stone-brick")
    table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-stone-brick")
    table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-stone-brick")

    table.insert(data.raw["module"]["productivity-module"].limitation, "big-steel-plate")
    table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-steel-plate")
    table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-steel-plate")

    if mods["bobplates"] then
        table.insert(data.raw["module"]["productivity-module"].limitation, "big-tin-plate")
        table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-tin-plate")
        table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-tin-plate")

        table.insert(data.raw["module"]["productivity-module"].limitation, "big-lead-plate")
        table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-lead-plate")
        table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-lead-plate")

        table.insert(data.raw["module"]["productivity-module"].limitation, "big-silver-plate")
        table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-silver-plate")
        table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-silver-plate")

        table.insert(data.raw["module"]["productivity-module"].limitation, "big-glass")
        table.insert(data.raw["module"]["productivity-module-2"].limitation, "big-glass")
        table.insert(data.raw["module"]["productivity-module-3"].limitation, "big-glass")
    end
end
