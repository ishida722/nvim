require("keymaps")

vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

vim.g.mapleader = " "
vim.opt.expandtab = true     -- タブ入力をスペースに変換する
vim.opt.shiftwidth = 2       -- 自動インデント時のスペース数
vim.opt.tabstop = 2          -- <Tab>キーを押したときの幅
vim.opt.softtabstop = 2      -- バックスペースや<BS>の挙動にも影響

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_user_command("OpenVimrc", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Open Neovim config file (init.lua)" })

-- daily note
vim.keymap.set("n", "<leader>tdn", require("diary").open_today, { desc = "Open today's diary" })

-- push notes
vim.keymap.set("n", "<leader>tp", require("diary").push_diary, { desc = "Push diary" })

-- texts find files
vim.keymap.set("n", "<leader>tff", require("diary").find_files, { desc = "find texts" })


-- Ctrl + p で次のタブ（tab page）へ移動
vim.keymap.set("n", "<C-p>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })

-- Ctrl + n で前のタブ（tab page）へ移動
vim.keymap.set("n", "<C-n>", ":tabprev<CR>", { noremap = true, silent = true, desc = "Next tab" })

-- 設定ファイル再読み込み
-- vim.keymap.set("n", "<leader>rr", require("lazy").reload("all"), { desc = "Reload Neovim config" })

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep in files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Switch buffer" })

vim.opt.foldmethod = "manual" -- または "indent"
vim.opt.foldexpr = "0"
vim.opt.foldenable = false

-- プラグイン読み込み
require("plugins")

