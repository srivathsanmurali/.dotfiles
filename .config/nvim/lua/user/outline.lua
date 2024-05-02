local status_ok, outline = pcall(require, "outline")
if not status_ok then
    return
end

outline.setup({
    outline_window = {
        position = "left",
        auto_close = true,
    },
})
