-------------------------------------------------
-- Environment Settings
-------------------------------------------------

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.o.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.compatible = false
vim.opt.errorbells = false
vim.opt.hlsearch = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 2
vim.opt.showtabline = 2
vim.opt.statusline = "%F"
vim.opt.swapfile = false
vim.opt.title = false
vim.opt.visualbell = false
vim.opt.wrap = true
vim.opt.writebackup = false

-- Default (dark) terminal gui and light GUI
if vim.fn.has("gui_running") == 1 then
    vim.o.background = "light"
end
vim.cmd("colorscheme default")

-------------------------------------------------
-- Tabs & indentation
-------------------------------------------------

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-------------------------------------------------
-- Bash indenting
-------------------------------------------------

vim.g.sh_indent_after_paren = 0
vim.g.sh_noisk = 1

-------------------------------------------------
-- Auto-reload files changed outside of Neovim
-------------------------------------------------

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    command = "checktime",
})

-------------------------------------------------
-- Commands
-------------------------------------------------

vim.api.nvim_create_user_command("Nohl", "nohlsearch", {})
vim.api.nvim_create_user_command("Svr", "source ~/.config/nvim/init.lua", {})
vim.api.nvim_create_user_command("Vimrc", "edit $MYVIMRC", {})
vim.api.nvim_create_user_command("Ypath", "let @+ = expand('%:p')", {})

-------------------------------------------------
-- Keymaps
-------------------------------------------------

local map = vim.keymap.set
map("i", "<Leader>b", "<C-k>Sb")
map("n", "<C-n>", ":tn<CR>")
map("n", "<C-p>", ":tp<CR>")
map("n", "<F6>", ":q<CR>")
map("n", "<F7>", ":w<CR>")
map("n", "<Leader>Y", ":.w !xsel --clipboard --input<CR><CR>")
map("n", "gd", "gd:nohl<CR>", { silent = true })
map("n", "yaw", "viwy")
map("v", "<Leader>y", ":!xsel --clipboard --input<CR><CR>", { silent = true })

-------------------------------------------------
-- Ported Vimscript functions to Lua
-------------------------------------------------

-- Remove duplicate lines
function RemoveDup()
    local seen = {}
    for i = 1, vim.fn.line("$") do
        local line = vim.fn.getline(i)
        if seen[line] then
            vim.fn.setline(i, "")
        else
            seen[line] = true
        end
    end
end
map("n", "<leader>rd", ":lua RemoveDup()<CR>", { silent = true })

-- Remove all duplicates entirely
function RemoveAllDup()
    local seen = {}
    for i = 1, vim.fn.line("$") do
        local line = vim.fn.getline(i)
        seen[line] = (seen[line] or 0) + 1
    end
    for i = 1, vim.fn.line("$") do
        local line = vim.fn.getline(i)
        if seen[line] > 1 then
            vim.fn.setline(i, "")
        end
    end
end
map("n", "<leader>rda", ":lua RemoveAllDup()<CR>", { silent = true })

-- Comment selection
function Comment(start_line, end_line)
    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        vim.fn.setline(i, "#" .. line)
    end
end
map("v", "<leader>c", ":'<,'>lua Comment(vim.fn.line(\"'<\"), vim.fn.line(\"'>\"))<CR>", { silent = true })

-- Uncomment selection
function Uncomment(start_line, end_line)
    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        if line:match("^#") then
            vim.fn.setline(i, line:gsub("^#", ""))
        end
    end
end
map("v", "<leader>u", ":'<,'>lua Uncomment(vim.fn.line(\"'<\"), vim.fn.line(\"'>\"))<CR>", { silent = true })

-------------------------------------------------
-- Makefile settings
-------------------------------------------------

function SetMakefileSettings()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    print("Makefile settings applied")
end
vim.api.nvim_create_user_command("MakefileSettings", "lua SetMakefileSettings()", {})

-------------------------------------------------
-- Ctags
-------------------------------------------------

function SetTags()
    vim.opt.tags = "tags,./tags;"
end
vim.api.nvim_create_user_command("SetTags", "lua SetTags()", {})

-------------------------------------------------
-- End of File
-------------------------------------------------
