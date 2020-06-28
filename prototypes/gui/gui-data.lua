data:extend({
    {
        type = "sprite",
        name = "pc_sprite",
        filename = "__project-corona__/thumbnail.png",
        width = 144,
        height = 144,
        flags = { "gui-icon" }
    },
    {
        type = "custom-input",
        name = "pc-open-gui",
        key_sequence = "CONTROL + SHIFT + P",
        consuming = "none"
    },
})

data.raw["gui-style"].default.pc_draggable_filler =
{
    type = "empty_widget_style",
    parent = "draggable_space",
    minimal_width = 0,
    top_padding = 20,
    height = 25,
    horizontally_stretchable = "on",
    vertically_stretchable = "on",
}

data.raw["gui-style"].default.pc_text_box =
{
    type = "textbox_style",
    width = 320,
    vertically_stretchable = "on",
}

data.raw["gui-style"].default.pc_switch_button =
{
    type = "switch_style",
    parent = "switch",
    top_padding = 2,
}

data.raw["gui-style"].default.pc_switch_button_label =
{
    type = "label_style",
    parent = "label",
    left_padding = 40,
    right_padding = 10,
}
