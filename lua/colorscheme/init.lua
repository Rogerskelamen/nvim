require("catppuccin").setup({
	flavour = "frappe", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "frappe",
	},
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
	},
})
