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
