" +-----------------------------------------------------------------------+
" |  /$$$$$$ /$$   /$$ /$$$$$$ /$$$$$$$$ /$$    /$$ /$$$$$$ /$$      /$$  |
" | |_  $$_/| $$$ | $$|_  $$_/|__  $$__/| $$   | $$|_  $$_/| $$$    /$$$  |
" |   | $$  | $$$$| $$  | $$     | $$   | $$   | $$  | $$  | $$$$  /$$$$  |
" |   | $$  | $$ $$ $$  | $$     | $$   |  $$ / $$/  | $$  | $$ $$/$$ $$  |
" |   | $$  | $$  $$$$  | $$     | $$    \  $$ $$/   | $$  | $$  $$$| $$  |
" |   | $$  | $$\  $$$  | $$     | $$     \  $$$/    | $$  | $$\  $ | $$  |
" |  /$$$$$$| $$ \  $$ /$$$$$$   | $$ /$$  \  $/    /$$$$$$| $$ \/  | $$  |
" |  |______/|__/  \__/|______/   |__/|__/   \_/    |______/|__/     |__/ |
" +-----------------------------------------------------------------------+

"       .__               .__                
" ___  _|__| _____ ______ |  |  __ __  ____  
" \  \/ /  |/     \\____ \|  | |  |  \/ ___\ 
"  \   /|  |  Y Y  \  |_> >  |_|  |  / /_/  |
"   \_/ |__|__|_|  /   __/|____/____/\___  / 
"                \/|__|             /_____/ 

call plug#begin()

"+=========LUALINE.NVIM==========+
Plug 'nvim-lualine/lualine.nvim'
"+===============================+

"+===================PYWAL.NVIM===================+
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
"+================================================+

"+=======NOICE.NVIM=======+
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
"+========================+

"+=======GITSIGNS.NVIM=======+
Plug 'lewis6991/gitsigns.nvim'
"+===========================+

"+====NVIM-TREE.NVIM====+
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
"+======================+

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

Plug 'm4xshen/autoclose.nvim'

call plug#end()


" .__               .__  .__               
" |  |  __ _______  |  | |__| ____   ____  
" |  | |  |  \__  \ |  | |  |/    \_/ __ \ 
" |  |_|  |  // __ \|  |_|  |   |  \  ___/ 
" |____/____/(____  /____/__|___|  /\___  >
"                 \/             \/     \/ 

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'pywal-nvim',
    component_separators = { left = " ", right = " "},
    section_separators = { left = " ", right = " "},
  }
}
END


"                               .__   
" ______ ___.__.__  _  _______  |  |  
" \____ <   |  |\ \/ \/ /\__  \ |  |  
" |  |_> >___  | \     /  / __ \|  |__
" |   __// ____|  \/\_/  (____  /____/
" |__|   \/                   \/

lua << END
local pywal = require('pywal')
pywal.setup()
END

"               .__              
"   ____   ____ |__| ____  ____  
"  /    \ /  _ \|  |/ ___\/ __ \ 
" |   |  (  <_> )  \  \__\  ___/ 
" |___|  /\____/|__|\___  >___  >
"      \/               \/    \/ 

lua require("noice").setup()

"   ________._______________________.___  ________  _______    _________
"  /  _____/|   \__    ___/   _____/|   |/  _____/  \      \  /   _____/
" /   \  ___|   | |    |  \_____  \ |   /   \  ___  /   |   \ \_____  \ 
" \    \_\  \   | |    |  /        \|   \    \_\  \/    |    \/        \
"  \______  /___| |____| /_______  /|___|\______  /\____|__  /_______  /
"         \/                     \/             \/         \/        \/

lua require('gitsigns').setup()

"            .__                    __                         
"   _______  _|__| _____           _/  |________   ____   ____  
"  /    \  \/ /  |/     \   ______ \   __\_  __ \_/ __ \_/ __ \ 
" |   |  \   /|  |  Y Y  \ /_____/  |  |  |  | \/\  ___/\  ___/ 
" |___|  /\_/ |__|__|_|  /          |__|  |__|    \___  >\___  >
"      \/              \/                             \/     \/

lua << END
require("nvim-tree").setup({

  view = {
    width = 30,
    side = "left",
    number = true,
    relativenumber = false,
    signcolumn = "yes",
  },

  update_cwd = true,
})

vim.keymap.set('n', '<F25>', ':NvimTreeToggle<CR>')
vim.keymap.set('i', '<F25>', ':NvimTreeToggle<CR>')

vim.keymap.set('n', '<F26>', ':NvimTreeFindFile<CR>')
vim.keymap.set('i', '<F26>', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<F27>', ':NvimTreeCollapse<CR>')
vim.keymap.set('i', '<F27>', ':NvimTreeCollapse<CR>')
END

set signcolumn=yes

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

lua << END
require("autoclose").setup({
  filetypes = {
    ["*"] = true,
  },
  -- Key mappings
  mappings = {
    ["("] = { ")", "auto" },
    ["["] = { "]", "auto" },
    ["{"] = { "}", "auto" },
    ["'"] = { "'", "auto" },
    ['"'] = { '"', "auto" },
    ["<"] = { ">", "auto" },
  },
})
END
