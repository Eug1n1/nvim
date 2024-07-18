local is_ok, luasnip = pcall(require, "luasnip")
if not is_ok then
	return
end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("typescript", {
	s("endp", {
		t("router."),
		i(1, "get"),
		t("('"),
		i(2, "path"),
		t("', (req: Request, res: Response) => {"),
        i(3),
        t("})"),
	}),
})
