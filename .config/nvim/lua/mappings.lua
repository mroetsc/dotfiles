require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- Alt+Arrow navigation, seamless across vim splits, tmux panes, and tmux windows.
-- Tmux forwards Alt+Arrow here when this pane runs vim (see tmux.conf's is_vim check);
-- if vim has no more windows to move into, hand off to tmux (pane, then window at the edge).
local pane_flag = { h = "L", j = "D", k = "U", l = "R" }

local function tmux_navigate(direction, window_fallback)
	local win_before = vim.fn.win_getid()
	vim.cmd("wincmd " .. direction)
	if vim.fn.win_getid() ~= win_before then
		return
	end

	if window_fallback then
		local at_edge = vim.fn.system("tmux display-message -p '#{pane_at_" .. window_fallback.edge .. "}'")
		if vim.trim(at_edge) == "1" then
			vim.fn.system("tmux " .. window_fallback.cmd)
			return
		end
	end

	vim.fn.system("tmux select-pane -" .. pane_flag[direction])
end

vim.keymap.set("n", "<M-Left>", function()
	tmux_navigate("h", { edge = "left", cmd = "previous-window" })
end)
vim.keymap.set("n", "<M-Right>", function()
	tmux_navigate("l", { edge = "right", cmd = "next-window" })
end)
vim.keymap.set("n", "<M-Up>", function()
	tmux_navigate("k")
end)
vim.keymap.set("n", "<M-Down>", function()
	tmux_navigate("j")
end)
