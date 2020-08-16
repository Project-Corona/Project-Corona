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

local style = data.raw["gui-style"].default

style.pc_draggable_filler =
{
    type = "empty_widget_style",
    parent = "draggable_space",
    minimal_width = 0,
    top_padding = 20,
    height = 25,
    horizontally_stretchable = "on",
    vertically_stretchable = "on",
}
style.pc_table_line =
{
    type = "line_style",
    parent = "line",
    width = 20,
}
style.pc_scroll_pane =
{
    type = "scroll_pane_style",
    parent = "scroll_pane",
    maximal_height = 400
}
