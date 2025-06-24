local M = {}

function M.reload_nvim()
  local modules_to_reload = {
    "diary",        -- 自分のLuaモジュール名（例）
    "reload",       -- この関数を持ってるモジュール自身もリロード可能に
    -- 他にもあればここに追加！
  }

  for _, module in ipairs(modules_to_reload) do
    package.loaded[module] = nil
  end

  vim.cmd("source $MYVIMRC")
  print("Neovim config reloaded ✨")
end

return M

