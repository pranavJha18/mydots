return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				--	light = "latte",
				--	dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic", "bold" },
				loops = {},
				functions = { "bold" },
				keywords = {},
				strings = { "bold" },
				variables = {},
				numbers = { "bold", "italic" },
				booleans = {},
				properties = {},
				types = {},
				operators = { "italic" },
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {
				mocha = {
					base = "#0F111A",
					green = "#c3e88d",
					yellow = "#ffcb6b",
					cyan = "#84ffff",
					text = "#eeffff",
					blue = "#82aaff",
				},
			},
			--	custom_highlights = {},
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.surface2 },
				}
			end,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				noice = true,
				lsp_trouble = true,
				which_key = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
