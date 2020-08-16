local gui = require("prototypes.gui.gui")
local blueprint_string = require("prototypes.gui.blueprint-strings")

local function gui_regen(player)
    gui.regen(player)
end

local function insert_string_item(event, string, item)
    -- Import a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) from a string
    local player = game.get_player(event.player_index)
    local inventory = player.get_inventory(defines.inventory.character_main)
    inventory.insert(item)
    local string_item = inventory.find_item_stack(item)
    return string_item.import_stack(string)
end

local function insert_common_item(event, name, amount)
    local player = game.get_player(event.player_index)
    return player.insert({ name = name, count = amount })
end

local function find_duplicates(table)
    local seen = {}
    local duplicate = {}
    for _, value in pairs(table) do
        if seen[value] then
            duplicate[value] = value
        else
            seen[value] = value
        end
    end
    return duplicate
end

script.on_event(defines.events.on_gui_click, function(event)
    local player = game.get_player(event.player_index)
    local screen_flow = player.gui.screen
    local pc_tabbed_pane = screen_flow.pc_main_gui_window.pc_body.pc_tab_frame.pc_tabbed_pane
    local pc_tab_2_contents = pc_tabbed_pane.pc_tab_2_contents
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
    elseif clicked_name == "pc_all_tech" then
        player.force.research_all_technologies(game.players)
    elseif clicked_name == "pc_reset" then
        player.force.reset()
    elseif clicked_name == "pc_cheat_mode" then
        player.cheat_mode = true
    elseif clicked_name == "pc_always_day" then
        player.surface.always_day = true
    elseif clicked_name == "pc_god_mode" then
        player.character = nil
        pc_tabbed_pane.remove_tab(pc_tabbed_pane.pc_tab_1)
    elseif clicked_name == "pc_get_duplicates" then
        local pc_mods_table_scroll_pane = pc_tab_2_contents.add {
            type = "scroll-pane",
            style = "pc_scroll_pane"
        }
        local pc_mods_table = pc_mods_table_scroll_pane.add {
            type = "table",
            column_count = 3,
            draw_horizontal_lines = true,
        }
        local key_sequence_table = {}
        for input_name, _ in pairs(game.custom_input_prototypes) do
            table.insert(key_sequence_table, game.custom_input_prototypes[input_name].key_sequence)
        end
        local duplicate_key_sequence_table = {}
        for _, key_sequence in pairs(find_duplicates(key_sequence_table)) do
            table.insert(duplicate_key_sequence_table, key_sequence)
        end
        for input_name, _ in pairs(game.custom_input_prototypes) do
            for _, duplicate_input_key_sequence in pairs(find_duplicates(key_sequence_table)) do
                if game.custom_input_prototypes[input_name].key_sequence == duplicate_input_key_sequence then
                    if duplicate_input_key_sequence ~= "" then
                        pc_mods_table.add {
                            type = "label",
                            name = "pc_input_name_" .. input_name,
                            caption = { "controls." .. input_name }
                        }
                        pc_mods_table.add {
                            type = "line",
                            name = "pc_input_buffer_" .. input_name,
                            style = "pc_table_line",
                        }
                        pc_mods_table.add {
                            type = "label",
                            name = "pc_input_key_sequence_" .. input_name,
                            caption = game.custom_input_prototypes[input_name].key_sequence
                        }
                    end
                end
            end
        end
        if next(duplicate_key_sequence_table) == nil then
            pc_tab_2_contents.add {
                type = "label",
                caption = "No Duplicate Inputs Found"
            }
        end
        pc_tab_2_contents.pc_get_duplicates.destroy()
    end
end)

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

script.on_init(function()
        remote.call("freeplay", "set_disable_crashsite", true)
        remote.call("freeplay", "set_skip_intro", true)
end)

script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    gui_regen(player)
    if settings.startup["enable-project-corona-map-manipulation"].value == true then
        if settings.startup["treeless-map"].value == true then
            player.remove_item({ name = "wood", count = 1 })
            player.insert({ name = "small-electric-pole", count = 20 })
            if game.active_mods["bobgreenhouse"] then
                player.insert({ name = "seedling", count = 50 })
            end
        end
        if settings.startup["waterless-map"].value == true and game.active_mods["StoneWaterWell"] then
            player.insert({ name = "stone-waterwell", count = 1 })
        end
    end
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
