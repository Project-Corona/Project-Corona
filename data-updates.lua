require("prototypes.recipe.recipe-updates")
require("prototypes.technology.technology-updates")

if mods["miniloader"] then
    data.raw.recipe["chute-miniloader"].enabled = false
end
