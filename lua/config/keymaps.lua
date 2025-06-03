-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set
local cmd = vim.cmd

-- General Keymaps
keymap("n", "<leader>pv", cmd.Ex, { desc = "Open Netrw explorer" })

keymap("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
keymap("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
keymap("n", "<leader>Y", "\"+Y", { desc = "Yank whole line to system clipboard" })

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux-sessionizer" })

-- Funktion zum Ausführen von Python- oder C-Programmen
function RunCurrentFile()
    local file = vim.fn.expand("%")  -- Aktuelle Datei mit Pfad
    local filetype = vim.bo.filetype -- Dateityp bestimmen
    -- local output = vim.fn.expand("%:r") -- Dateiname ohne .c/.py -- Not used in current logic
    local dir = vim.fn.expand("%:p:h") -- Verzeichnis der aktuellen Datei

    if filetype == "python" then
        -- Python-Skript ausführen
        cmd("!python3 " .. vim.fn.shellescape(file))
    elseif filetype == "c" then
        -- Alle .c-Dateien im gleichen Verzeichnis suchen
        local c_files_glob = vim.fn.glob(dir .. "/*.c", false, true)
        if type(c_files_glob) == "string" and c_files_glob ~= "" then -- Handle single file case
            c_files_glob = vim.split(c_files_glob, "\n")
        elseif type(c_files_glob) ~= "table" then
            c_files_glob = {}
        end

        if #c_files_glob == 0 then
            print("No .c files found in the current directory.")
            return
        end

        local c_file_list_parts = {}
        for _, cfile_path in ipairs(c_files_glob) do
            table.insert(c_file_list_parts, vim.fn.shellescape(cfile_path))
        end
        local c_file_list = table.concat(c_file_list_parts, " ") -- Dateien als Argumentkette


        -- Prüfen, ob math.h in irgendeiner Datei genutzt wird
        local has_math_h = false
        for _, cfile_path in ipairs(c_files_glob) do
            local file_handle = io.open(cfile_path, "r")
            if file_handle then
                for line in file_handle:lines() do
                    if line:match("#include%s*<math.h>") then
                        has_math_h = true
                        break
                    end
                end
                file_handle:close()
            end
            if has_math_h then break end
        end

        local output_executable = vim.fn.shellescape(dir .. "/main.out")
        local compile_command = "gcc " .. c_file_list .. " -o " .. output_executable
        if has_math_h then
            compile_command = compile_command .. " -lm"
        end

        cmd("!" .. compile_command .. " && " .. output_executable)
    else
        print("Dateityp nicht unterstützt!")
    end
end

-- Keymap für das Ausführen von Python und C mit <leader>r
keymap("n", "<leader>r", "<cmd>lua RunCurrentFile()<CR>", { noremap = true, silent = true, desc = "Run current file (Python/C)" })

-- Deaktivieren der Pfeiltasten (aus set.lua)
keymap("", "<up>", "<nop>", { noremap = true })
keymap("", "<down>", "<nop>", { noremap = true })
keymap("i", "<up>", "<nop>", { noremap = true })
keymap("i", "<down>", "<nop>", { noremap = true })

-- Note: Keymaps specific to plugins (like Telescope, Harpoon, Undotree, LazyGit)
-- will generally be defined within their respective plugin configuration files in lua/plugins/
