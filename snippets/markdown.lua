local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		{ trig = "marp" },
		fmt(
			[[
			---
			marp: true
			theme: shimizu
			title: Research Progress
			author: Shuichiro Shimizu
			paginate: true
			---
			<style scoped>
			section {{
			  justify-content: center;
			  text-align: center;
			}}
			h1 {{
				font-size: 2em;
			}}
			</style>

			# {}
			## {}
			{}, 2023
			D1 $\,$ Shuichiro SHIMIZU

			---
			# {}
			]],
			{ i(1), i(2), i(3), i(4) }
		)
	),
}
