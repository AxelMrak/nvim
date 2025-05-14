-- Options are automatically loaded before lazy.nvim startup
local opt = vim.opt
opt.termguicolors = true
opt.wrap = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 🧹 Interfaz limpia
opt.number = true -- muestra números de línea
opt.relativenumber = true -- muestra números relativos
opt.cursorline = true -- resalta la línea actual
opt.signcolumn = "yes" -- siempre muestra la columna de signos (LSP, Git)
opt.termguicolors = true -- soporte para más colores

-- 🧠 Navegación y edición
opt.scrolloff = 8 -- mantiene espacio arriba/abajo al hacer scroll
opt.sidescrolloff = 8
opt.wrap = false -- no hacer wrap de líneas largas
opt.linebreak = true -- si usás wrap, que corte por palabra

-- 🧼 Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- convierte tabs a espacios
opt.smartindent = true

-- 🔍 Búsqueda
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- 🕹️ UX general
opt.mouse = "a" -- habilita mouse
opt.clipboard = "unnamedplus" -- sistema clipboard
opt.updatetime = 300 -- mejora el tiempo de respuesta en plugins
opt.timeoutlen = 300 -- velocidad para comandos de tecla

-- 📝 Persistencia
opt.undofile = true -- guarda undo entre sesiones

-- 🧩 Autocompletado
opt.completeopt = { "menu", "menuone", "noselect" }

-- 🧼 Invisibles
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
