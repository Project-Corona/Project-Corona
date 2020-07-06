local mod_gui = require("mod-gui")

local gui = {}

gui.regen = function(player)
    gui.kill(player)
    
    --- Main GUI Toggle Button
    local button_flow = mod_gui.get_button_flow(player)
    local button = button_flow.add {
        type = "sprite-button",
        name = "pc_main_button",
        style = mod_gui.button_style,
        tooltip = { "pc-gui.tooltip", { "pc-gui.pc_mod_name" } },
        sprite = "pc_sprite",
    }
    button.visible = true
    
    --- Main GUI Window
    local main_gui_frame = player.gui.screen.add {
        type = "frame",
        name = "pc_main_gui_window",
        direction = "vertical",
        position = "center",
    }
    main_gui_frame.visible = false
    
    --- Title Bar of the Main GUI Window
    local title_flow = main_gui_frame.add {
        type = "flow",
        direction = "horizontal",
    }
    
    --- Title Text of Title Bar
    local title = title_flow.add {
        type = "label",
        caption = { "pc-gui.pc_mod_name" },
        style = "frame_title"
    }
    title.drag_target = main_gui_frame
    
    --- Empty Space between Title Text & Close Button
    local filler = title_flow.add {
        type = "empty-widget",
        style = "pc_draggable_filler",
    }
    filler.drag_target = main_gui_frame
    
    --- Close Button of the Title Bar
    title_flow.add {
        type = "sprite-button",
        name = "pc_close_button",
        style = "frame_action_button",
        sprite = "utility/close_white",
        hovered_sprite = "utility/close_black",
    }
    
    --- Body of the Main Gui Window
    local body_flow = main_gui_frame.add {
        type = "flow",
        name = "pc_body",
        direction = "horizontal",
    }
    
    --- Frame of the Body (Holds Tabbed Pane Window)
    local tab_frame = body_flow.add {
        type = "frame",
        name = "pc_tab_frame",
        style = "inventory_frame",
    }
    
    --- Tabbed Pane Window of the Body
    local tab_pane = tab_frame.add {
        type = "tabbed-pane",
        name = "pc_tabbed_pane",
    }
    
    --- Set the first tab in the list to be selected by default
    tab_pane.selected_tab_index = 1
    
    --- Tabs within Tabbed Pane Window ---
    
    --- Title Text of Tab 1
    local tab_1_title = tab_pane.add {
        type = "tab",
        name = "pc_tab_1",
        caption = { "pc-gui.tab-1-title" },
    }
    --- Contents of Tab 1
    local tab_1_contents = tab_pane.add {
        type = "flow",
        direction = "vertical",
    }
    --- Adds the Tab to the Tabbed Pane
    tab_pane.add_tab(tab_1_title, tab_1_contents)
    
    --- Row 1 of Tab 1
    local tab_1_row_1 = tab_1_contents.add {
        type = "flow",
        direction = "horizontal",
    }
    --- Contents of Row 1 of Tab 1
    tab_1_row_1.add {
        type = "sprite-button",
        name = "pc_bp_2L_button",
        style = mod_gui.button_style,
        sprite = "item/blueprint-book",
    }
    tab_1_row_1.add {
        type = "label",
        caption = { "pc-gui.2L-blueprint-book" },
    }
    --- Row 2 of Tab 1
    local tab_1_row_2 = tab_1_contents.add {
        type = "flow",
        direction = "horizontal",
    }
    --- Contents of Row 2 of Tab 1
    tab_1_row_2.add {
        type = "sprite-button",
        name = "pc_bp_4L_button",
        style = mod_gui.button_style,
        sprite = "item/blueprint-book",
    }
    tab_1_row_2.add {
        type = "label",
        caption = { "pc-gui.4L-blueprint-book" },
    }
    --- Row 3 of Tab 1
    local tab_1_row_3 = tab_1_contents.add {
        type = "flow",
        direction = "horizontal",
    }
    --- Contents of Row 3 of Tab 1
    tab_1_row_3.add {
        type = "sprite-button",
        name = "pc_bp_belt_button",
        style = mod_gui.button_style,
        sprite = "item/blueprint-book",
    }
    tab_1_row_3.add {
        type = "label",
        caption = { "pc-gui.belt-balancer-blueprint-book" },
    }
    
    --- Title Text of Tab 2
    local tab_2_title = tab_pane.add {
        type = "tab",
        caption = { "pc-gui.tab-2-title" },
    }
    --- Contents of Tab 2
    local tab_2_contents = tab_pane.add {
        type = "flow",
        name = "pc_tab_2_contents",
        direction = "vertical",
    }
    --- Adds the Tab to the Tabbed Pane
    tab_pane.add_tab(tab_2_title, tab_2_contents)
    
    tab_2_contents.add {
        type = "button",
        name = "pc_get_duplicates",
        style = mod_gui.button_style,
        caption = "Find Duplicate Inputs"
    }
    
    if settings.startup["enable-dev-tools"].value == true then
        --- Title Text of Tab 3
        local tab_3_title = tab_pane.add {
            type = "tab",
            caption = { "pc-gui.tab-3-title" },
        }
        --- Contents of Tab 3
        local tab_3_contents = tab_pane.add {
            type = "flow",
            direction = "vertical",
        }
        --- Adds the Tab to the Tabbed Pane
        tab_pane.add_tab(tab_3_title, tab_3_contents)
        
        --- Row 1 of Tab 3
        local tab_3_row_1 = tab_3_contents.add {
            type = "flow",
            direction = "horizontal",
        }
        tab_3_row_1.add {
            type = "sprite-button",
            name = "pc_cheat_electric",
            style = mod_gui.button_style,
            sprite = "item/electric-energy-interface",
        }
        tab_3_row_1.add {
            type = "label",
            caption = { "pc-gui.cheat-electricity" },
        }
        
        local tab_3_row_2 = tab_3_contents.add {
            type = "flow",
            direction = "horizontal",
        }
        tab_3_row_2.add {
            type = "sprite-button",
            name = "pc_infinity_chest",
            style = mod_gui.button_style,
            sprite = "item/infinity-chest",
        }
        tab_3_row_2.add {
            type = "label",
            caption = { "pc-gui.infinity-chest" },
        }
        local tab_3_row_3 = tab_3_contents.add {
            type = "flow",
            direction = "horizontal",
        }
        tab_3_row_3.add {
            type = "sprite-button",
            name = "pc_infinity_pipe",
            style = mod_gui.button_style,
            sprite = "item/infinity-pipe",
        }
        tab_3_row_3.add {
            type = "label",
            caption = { "pc-gui.infinity-pipe" },
        }
        local tab_3_row_4 = tab_3_contents.add {
            type = "flow",
            direction = "horizontal",
        }
        tab_3_row_4.add {
            type = "sprite-button",
            name = "pc_all_tech",
            style = mod_gui.button_style,
            sprite = "item/automation-science-pack",
        }
        tab_3_row_4.add {
            type = "label",
            caption = { "pc-gui.all-tech" },
        }
        local tab_3_row_5 = tab_3_contents.add {
            type = "flow",
            direction = "horizontal",
        }
        tab_3_row_5.add {
            type = "button",
            name = "pc_reset",
            style = mod_gui.button_style,
            caption = { "pc-gui.reset" },
        }
        tab_3_row_5.add {
            type = "label",
            caption = { "pc-gui.reset-label" },
        }
        tab_3_contents.add {
            type = "button",
            name = "pc_cheat_mode",
            style = mod_gui.button_style,
            caption = "Cheat Mode"
        }
        tab_3_contents.add {
            type = "button",
            name = "pc_always_day",
            style = mod_gui.button_style,
            caption = "Always Day"
        }
        tab_3_contents.add {
            type = "button",
            name = "pc_god_mode",
            style = mod_gui.button_style,
            caption = "God Mode"
        }
    end
    
    --- Footer Bar of the Main GUI Window
    main_gui_frame.add {
        type = "flow",
        name = "footer_flow",
        direction = "horizontal",
    }
    
    --- Empty Space of Footer bar
    main_gui_frame.footer_flow.add {
        type = "empty-widget",
        name = "footer",
        style = "pc_draggable_filler",
    }
    main_gui_frame.footer_flow.footer.drag_target = main_gui_frame
end

gui.kill = function(player)
    local button_flow = mod_gui.get_button_flow(player)
    local main_gui_frame = player.gui.screen
    if button_flow["pc_main_button"] then
        button_flow["pc_main_button"].destroy()
    end
    if main_gui_frame["pc_main_gui_window"] then
        main_gui_frame["pc_main_gui_window"].destroy()
    end
end

return gui
