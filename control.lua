script.on_event(defines.events.on_player_created, function(event)
    game.players[event.player_index].remove_item { name = "wood", count = 1 }
    game.players[event.player_index].insert { name = "stone-waterwell", count = 1 }
    game.players[event.player_index].insert { name = "seedling", count = 50 }
    game.players[event.player_index].insert { name = "small-electric-pole", count = 20 }
end)
