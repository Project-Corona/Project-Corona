require("prototypes.gui.gui-control")

script.on_event(defines.events.on_player_created, function(event)
    if settings.startup["enable-project-corona-map-manipulation"].value == true then
        if settings.startup["treeless-map"].value == true then
            game.players[event.player_index].remove_item { name = "wood", count = 1 }
            game.players[event.player_index].insert { name = "small-electric-pole", count = 20 }
            if game.active_mods["bobgreenhouse"] then
                game.players[event.player_index].insert { name = "seedling", count = 50 }
            end
        end
        if settings.startup["waterless-map"].value == true and game.active_mods["StoneWaterWell"] then
            game.players[event.player_index].insert { name = "stone-waterwell", count = 1 }
        end
    end
end)
