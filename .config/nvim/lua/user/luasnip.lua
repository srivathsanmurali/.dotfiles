local loader_status_ok, vscode_loader = pcall(require, "luasnip/loaders/from_vscode")
if not loader_status_ok then
    return
end

-- Loading from friendly snippets
vscode_loader.lazy_load()

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("cpp", {
    s("dox", {
        t({"/**"}),
        t({"", "* @brief "}), i(1, "A short one line description"),
        t({"", "*"}),
        t({"", "* "}), i(2, "Longer description"),
        t({"", "*"}),
        t({"", "* @param "}), i(0, "Description on input param"),
        t({"", "* @return "}), i(3, "Description of return value"),
        t({"", "*/"}),
    }),
    s("@param", {
        t({"@param "}), i(1, "Description on input param"),
    }),
    s("@throws", {
        t({"@throws"}), i(1, "Description on input param"),
    })
})
