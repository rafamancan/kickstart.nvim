vim.opt.relativenumber = true

-- File Tree
vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<CR>')

-- Select All
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Better window movement
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Saving file with Ctrl-s
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move current line / block with Alt-j/k
vim.keymap.set('n', '<A-j>', ":m .+1<CR>==")
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==")
vim.keymap.set('v', '<A-k>', ":m '>+1<CR>gv-gv")
vim.keymap.set('v', '<A-j>', ":m '<-2<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":m '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-j>', ":m '<-2<CR>gv-gv")
vim.keymap.set('i', '<A-k>', "<Esc>:m .-2<CR>==gi")
vim.keymap.set('i', '<A-j>', "<Esc>:m .+1<CR>==gi")

-- Tabs buffers
vim.keymap.set('n', '<TAB>', ':bnext<CR>')
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>c', ':bd<CR>')


-- Replaces
vim.keymap.set('n', '<leader>rl', ':s//g<LEFT><LEFT>')
vim.keymap.set('n', '<leader>rf', ':%s//g<LEFT><LEFT>')

-- Toggle Terminal
vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>')

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"
cmp.mapping["<C-l>"] = function(fallback)
	cmp.mapping.abort()
	local copilot_keys = vim.fn["copilot#Accept"]()
	if copilot_keys ~= "" then
		vim.api.nvim_feedkeys(copilot_keys, "i", true)
	else
		fallback()
	end
end

vim.keymap.set('n', '<C-y>', ':Copilot panel<CR>')
