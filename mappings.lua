-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        [";"] = { ":" },
        -- buffers
        ["<leader>c"] = false,
        ["<leader>C"] = false,
        ["<leader>h"] = false,
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr)
                        require("astronvim.utils.buffer").close(bufnr)
                    end)
            end,
            desc = "Pick to close"
        },
        ["<leader>bc"] = {
            function() require("astronvim.utils.buffer").close() end,
            desc = "Close buffer"
        },
        ["<leader>bC"] = {
            function()
                require("astronvim.utils.buffer").close(0, true)
            end,
            desc = "Force close buffer"
        },
        ["<leader>bh"] = {
            function()
                local wins = vim.api.nvim_tabpage_list_wins(0)
                if #wins > 1 and
                    vim.api.nvim_get_option_value("filetype", { win = wins[1] }) ==
                    "neo-tree" then
                    vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
                end
                require("alpha").start(false, require("alpha").default_config)
            end,
            desc = "Home Screen"
        },
        -- explorer
        ["<leader>o"] = false,
        ["<leader>eo"] = { "<cmd>Neotree<cr>", desc = "Explorer open" },
        ["<leader>es"] = { "<cmd>Neotree show<cr>", desc = "Explorer show" },
        ["<leader>ee"] = { "<cmd>Neotree toggle<cr>", desc = "Explorer toggle" },
        ["<leader>ec"] = { "<cmd>Neotree close<cr>", desc = "Explorer close" },
        ["<leader>ef"] = { "<cmd>Neotree focus<cr>", desc = "Explorer files" },
        ["<leader>eb"] = { "<cmd>Neotree buffers<cr>", desc = "Explorer buffers" },
        ["<leader>eg"] = { "<cmd>Neotree git_status<cr>", desc = "Explorer git" },
        -- cmd
        ["<leader>n"] = false,
        ["<leader>/"] = false,
        ["<leader>w"] = false,
        ["<leader>q"] = false,
        ["<leader>cw"] = { "<cmd>w!<cr>", desc = "Save" },
        ["<leader>cq"] = { "<cmd>q!<cr>", desc = "Quit" },
        ["<leader>cW"] = { "<cmd>wq<cr>", desc = "Save file & Quit" },
        ["<leader>c/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            desc = "Comment line"
        },
        ["<leader>cn"] = { "<cmd>enew<cr>", desc = "New File" },
        -- live-server
        ["<leader>pt"] = {
            "<cmd>LiveServerStart<cr>",
            desc = "Start live-server"
        },
        ["<leader>pp"] = { "<cmd>LiveServerStop<cr>", desc = "Stop live-server" }
    },
    v = {
        ["<leader>/"] = false,
        ["<leader>c/"] = {
            "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
            desc = "Toggle comment line"
        }
    },
    i = {
        ["<C-s>"] = { "<cmd>w!<cr>", desc = "Save File" }, -- change description but the same command
        ["<C-z>"] = { "<cmd>u!<cr>", desc = "Undo changes" },
        ["<C-x>"] = { "<delete>", desc = "Delete" },
        ["<C-h>"] = { "<left>" },
        ["<C-j>"] = { "<down>" },
        ["<C-k>"] = { "<up>" },
        ["<C-l>"] = { "<right>" }
    }
}
