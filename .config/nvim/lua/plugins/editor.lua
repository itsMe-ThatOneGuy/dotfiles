return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"sharkdp/fd",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local telescope = require("telescope")

			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions
			telescope.setup({
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						theme = "dropdown",
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						hijack_netrw = true,
						initial_mode = "normal",
						mappings = {
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								-- your custom normal mode mappings
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")

			vim.keymap.set("n", "<leader>hs", builtin.help_tags)
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers({ initial_mode = "normal" })
			end)
			vim.keymap.set("n", "<leader>fs", function()
				builtin.find_files({ no_ignore = false, hidden = true, initial_mode = "normal" })
			end)
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", ";;", function()
				builtin.resume()
			end)
			vim.keymap.set("n", "<leader>ds", function()
				builtin.diagnostics({ initial_mode = "normal" })
			end)
			vim.keymap.set("n", "<leader>gs", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", "<leader>ws", function()
				builtin.grep_string({ initial_mode = "normal" })
			end)
			vim.keymap.set("n", "<leader>ss", function()
				builtin.builtin()
			end)
			vim.keymap.set("n", "<leader>so", function()
				builtin.oldfiles()
			end)

			vim.keymap.set("n", "<leader>ns", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
					follow = true,
					initial_mode = "normal",
				})
			end)

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end)

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end)

			vim.keymap.set("n", "<leader>pf", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end)
		end,
	},
	{
		"RRethy/vim-illuminate",
		enabled = false,
		config = function()
			local illuminate = require("illuminate")
			vim.api.nvim_set_keymap(
				"n",
				"<a-n>",
				'<cmd>lua require("illuminate").next_reference{wrap=true}<cr>',
				{ noremap = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<a-p>",
				'<cmd>lua require("illuminate").next_reference{reverse=true,wrap=true}<cr>',
				{ noremap = true }
			)

			illuminate.configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 200,
				filetypes_denylist = {
					"dirvish",
					"fugitive",
					"alpha",
					"NvimTree",
					"packer",
					"neogitstatus",
					"Trouble",
					"lir",
					"Outline",
					"spectre_panel",
					"toggleterm",
					"DressingSelect",
					"TelescopePrompt",
				},
				filetypes_allowlist = {},
				modes_denylist = {},
				modes_allowlist = {},
				providers_regex_syntax_denylist = {},
				providers_regex_syntax_allowlist = {},
				under_cursor = true,
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"css",
					"html",
					"javascript",
				},
				tailwind = true,
				css = true,
				always_update = true,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>g", vim.cmd.Git)
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdowPreviewTogle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
