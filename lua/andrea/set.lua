vim.opt.guicursor = "" 

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false -- Zeilenumbrechen

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" 
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 
vim.opt.signcolumn = "yes" 
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80" 

--deaktivieren des Touchpads
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

vim.opt.mouse = "" --deaktivieren der Maus
