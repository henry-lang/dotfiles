local plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
plug('sainnhe/gruvbox-material')
plug('neoclide/coc.nvim', {branch = 'release'})
plug('nvim-lua/plenary.nvim')
plug('nvim-telescope/telescope.nvim')
plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
plug('nvim-lualine/lualine.nvim')
vim.call('plug#end')

vim.cmd('colorscheme gruvbox-material')
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.cmd('set noshowmode')
vim.cmd('set noruler')
vim.cmd('set laststatus=0')
vim.cmd('set noshowcmd')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set relativenumber')

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- KEY BINDINGS
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- Accept completion on enter
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- Navigate suggestions using tab and shift-tab
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

require('telescope').setup({
	defaults = {
        previewer = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
	}
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
})

require('lualine').setup({
    options = {
        theme = 'auto',
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
    }
})
