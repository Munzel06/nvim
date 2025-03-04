vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Funktion zum Ausführen von Python- oder C-Programmen (mit mehreren Dateien für C)
function RunCurrentFile()
    local file = vim.fn.expand("%")  -- Aktuelle Datei mit Pfad
    local filetype = vim.bo.filetype -- Dateityp bestimmen
    local output = vim.fn.expand("%:r") -- Dateiname ohne .c/.py
    local dir = vim.fn.expand("%:p:h") -- Verzeichnis der aktuellen Datei

    if filetype == "python" then
        -- Python-Skript ausführen
        vim.cmd("!python3 " .. file)

    elseif filetype == "c" then
        -- Alle .c-Dateien im gleichen Verzeichnis suchen
        local c_files = vim.fn.glob(dir .. "/*.c", false, true)
        local c_file_list = table.concat(c_files, " ") -- Dateien als Argumentkette

        -- Prüfen, ob math.h in irgendeiner Datei genutzt wird
        local has_math_h = false
        for _, cfile in ipairs(c_files) do
            for line in io.lines(cfile) do
                if line:match("#include%s*<math.h>") then
                    has_math_h = true
                    break
                end
            end
            if has_math_h then break end
        end

        -- Falls math.h enthalten ist, mit -lm kompilieren, sonst normal
        if has_math_h then
            vim.cmd("!gcc " .. c_file_list .. " -o " .. dir .. "/main.out -lm && " .. dir .. "/main.out")
        else
            vim.cmd("!gcc " .. c_file_list .. " -o " .. dir .. "/main.out && " .. dir .. "/main.out")
        end

    else
        print("Dateityp nicht unterstützt!")
    end
end

-- Keymap für das Ausführen von Python und C mit <leader>r
vim.keymap.set("n", "<leader>r", "<cmd>lua RunCurrentFile()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

