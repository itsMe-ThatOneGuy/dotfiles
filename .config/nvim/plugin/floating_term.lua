vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = vim.o.columns
	local height = vim.o.lines

	-- Calculate default dimensions (80% of screen)
	local win_width = math.floor(width * 0.8)
	local win_height = math.floor(height * 0.8)

	-- Override with user-provided options
	if opts.width then
		win_width = math.min(opts.width, width)
	end
	if opts.height then
		win_height = math.min(opts.height, height)
	end

	-- Calculate centered position
	local col = math.floor((width - win_width) / 2)
	local row = math.floor((height - win_height) / 2)

	-- Create a buffer for the floating window
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	-- Configure the floating window
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = win_width,
		height = win_height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	})

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		vim.cmd("cd %:p:h")
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.term()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)
