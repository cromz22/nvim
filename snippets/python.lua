local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		{ trig = "main" },
		fmt(
			[[
			def main():
				{}


			if __name__ == "__main__":
				main()
			]],
			{ i(1) }
		)
	),
	s(
		{ trig = "intin", desc = "single int input" },
		fmt(
			[[
			{} = int(input())
			]],
			{ i(1) }
		)
	),
	s(
		{ trig = "mlin", desc = "multiple int input" },
		fmt(
			[[
			{} = map(int, input().split())
			]],
			{ i(1) }
		)
	),
	s(
		{ trig = "listin", desc = "list input" },
		fmt(
			[[
			{} = list(map(int, input().split()))
			]],
			{ i(1) }
		)
	),
	s(
		{ trig = "ftol", desc = "file to list" },
		fmt(
			[[
			with open({}) as f:
				{} = [l.strip() for l in f.readlines()]
			]],
			{ i(1), i(2) }
		)
	),
	s(
		{ trig = "open", desc = "open file" },
		fmt(
			[[
			with open({}) as f:
				{}
			]],
			{ i(1), i(2) }
		)
	),
}
