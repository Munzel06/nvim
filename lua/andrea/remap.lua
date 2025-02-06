
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Funktion zum Ausführen von Python- oder C-Programmen
function RunCurrentFile()
    local file = vim.fn.expand("%")  -- Aktuelle Datei mit Pfad
    local filetype = vim.bo.filetype -- Dateityp bestimmen
    local output = vim.fn.expand("%:r") -- Dateiname ohne .c/.py

    if filetype == "python" then
        -- Python-Skript ausführen
        vim.cmd("!python3 " .. file)

    elseif filetype == "c" then
        -- Prüfen, ob die Datei math.h benutzt
        local has_math_h = false
        for line in io.lines(file) do
            if line:match("#include%s*<math.h>") then
                has_math_h = true
                break
            end
        end

        -- Falls math.h enthalten ist, mit -lm kompilieren, sonst normal
        if has_math_h then
            vim.cmd("!gcc " .. file .. " -o " .. output .. " -lm && ./" .. output)
        else
            vim.cmd("!gcc " .. file .. " -o " .. output .. " && ./" .. output)
        end

    else
        print("Dateityp nicht unterstützt!")
    end
end

-- Keymap für das Ausführen von Python und C mit <leader>r
vim.keymap.set("n", "<leader>r", "<cmd>lua RunCurrentFile()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

