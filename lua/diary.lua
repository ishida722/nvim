local M = {}

local texts_dir = vim.fn.expand("~/projects/Texts")
local daily_dir = texts_dir .. "/" .. "daily-notes"
local inbox_dir = texts_dir .. "/" .. "inbox"

-- daily noteを開く
function M.open_today()
  local date = os.date("%Y-%m-%d")        -- 2025-05-07
  local year = os.date("%Y")              -- 2025
  local month = os.date("%m")             -- 05

  -- パス構築: ~/notes/2025/05/2025-05-07.md
  local path = vim.fn.expand(daily_dir .. "/" .. year .. "/" .. month .. "/" .. date .. ".md")

  -- すでに開いてるタブがあるか調べる
  -- for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
  --   for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabnr)) do
  --     local bufnr = vim.api.nvim_win_get_buf(winid)
  --     local bufname = vim.api.nvim_buf_get_name(bufnr)
  --     if bufname == path then
  --       vim.api.nvim_set_current_tabpage(tabnr)
  --       vim.api.nvim_set_current_win(winid)
  --       return
  --     end
  --   end
  -- end

  -- フォルダがなければ作る
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")

  -- 新しいタブで開く
  vim.cmd("tabnew " .. path)
end

function M.push_diary()
  local commit_message = "update"

  -- Gitコマンドを順番に実行
  local function run(cmd)
    local output = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      print("❌ Error: " .. cmd)
      print(output)
    else
      print("✅ " .. cmd)
    end
  end

  vim.cmd("cd " .. texts_dir) -- notes ディレクトリに移動

  run("git add .")
  run("git commit -m '" .. commit_message .. "'")
  run("git pull")
  run("git push")
end

-- find_files 
function M.find_files()
  require("telescope.builtin").find_files({
    prompt_title = "Find Text File",
    cwd = texts_dir,
  })
end

return M

