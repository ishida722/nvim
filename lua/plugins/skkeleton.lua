return {
  {
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
      vim.fn["skkeleton#config"]({
        eggLikeNewline = true,
        registerConvertResult = true,
        globalDictionaries = { "~/.skk/SKK-JISYO.L" },
        eggLikeNewline = true,
      })
      vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)", { desc = "Enable skkeleton" })
      vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-enable)", { desc = "Enable skkeleton" })
      vim.keymap.set("i", "<C-l>", "<Plug>(skkeleton-disable)", { desc = "Disable skkeleton" })
      vim.keymap.set("c", "<C-l>", "<Plug>(skkeleton-disable)", { desc = "Disable skkeleton" })
    end,
  },
}
