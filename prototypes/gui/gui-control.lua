local gui = require("prototypes.gui.gui")
local blueprint_string = require("prototypes.gui.blueprint-strings")

local function gui_regen(player)
    gui.regen(player)
end

local function insert_string_item(event, string, item) -- Import a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) from a string
    local player = game.get_player(event.player_index)
    local inventory = player.get_inventory(defines.inventory.character_main)
    inventory.insert(item)
    local string_item = inventory.find_item_stack(item)
    return string_item.import_stack(string)
end

local function insert_common_item(event, name, amount)
    local player = game.get_player(event.player_index)
    local inventory = player.get_inventory(defines.inventory.character_main)
    return inventory.insert({ name = name, count = amount })
end

script.on_event(defines.events.on_gui_click, function(event)
    local player = game.get_player(event.player_index)
    local screen_flow = player.gui.screen
    local clicked_name = event.element.name
    if clicked_name == "pc_main_button" then
        if not screen_flow["pc_main_gui_window"] then
            gui_regen(player)
        end
        screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
        screen_flow["pc_main_gui_window"].auto_center = true
    elseif clicked_name == "pc_close_button" then
        screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
    elseif clicked_name == "pc_bp_2L_button" then
        if player.can_insert("blueprint-book") then
            insert_string_item(event, blueprint_string.two_lane_book, "blueprint")
            player.print("Blueprint book imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
        screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
    elseif clicked_name == "pc_bp_4L_button" then
        if player.can_insert("blueprint-book") then
            insert_string_item(event, blueprint_string.four_lane_book, "blueprint")
            player.print("Blueprint book imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
        screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
    elseif clicked_name == "pc_bp_belt_button" then
        if player.can_insert("blueprint-book") then
            insert_string_item(event, blueprint_string.belt_balancer_book, "blueprint")
            player.print("Blueprint book imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
        screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
    elseif clicked_name == "pc_cheat_electric" then
        if player.can_insert("blueprint-book") then
            insert_common_item(event, "electric-energy-interface", 50)
            player.print("Electric Energy Interface imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
    elseif clicked_name == "pc_infinity_chest" then
        if player.can_insert("blueprint-book") then
            insert_common_item(event, "infinity-chest", 10)
            player.print("Infinity Chest imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
    elseif clicked_name == "pc_infinity_pipe" then
        if player.can_insert("blueprint-book") then
            insert_common_item(event, "infinity-pipe", 10)
            player.print("Infinity Pipe imported successfully.")
        else
            player.print("Not enough inventory space.")
        end
    elseif clicked_name == "pc_cheat_mode" then
        player.cheat_mode = true
    elseif clicked_name == "pc_always_day" then
        player.surface.always_day = true
    end
end)

--- Waiting for game version 0.18.35
--[[
script.on_event(defines.events.on_gui_switch_state_changed, function(event)
    local player = game.get_player(event.player_index)
    local clicked_name = event.element.name
    if clicked_name == "pc_cheat_mode" then
        player.cheat_mode = true
    end
end)
--]]
script.on_event("pc-open-gui", function(event)
    local player = game.get_player(event.player_index)
    local screen_flow = player.gui.screen
    if not screen_flow["pc_main_gui_window"] then
        gui_regen(player)
    end
    screen_flow["pc_main_gui_window"].visible = not screen_flow["pc_main_gui_window"].visible
    screen_flow["pc_main_gui_window"].auto_center = true
end)

script.on_configuration_changed(function()
    for _, player in pairs(game.players) do
        gui_regen(player)
    end
end)

script.on_event(defines.events.on_player_created, function(event)
    gui_regen(game.get_player(event.player_index))
end)

if settings.startup["enable-dev-tools"].value == true then
    commands.add_command("pc-gui", { "msg.new-game-plus-gui-command-help" }, function(event)
        if game.get_player(event.player_index).admin then
            for _, player in pairs(game.players) do
                gui_regen(player)
            end
        end
    end)
end
