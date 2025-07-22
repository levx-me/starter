require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "rw", ":update<cr><esc>")
map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })
map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk" })
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
map("n", "<leader>rh", require("gitsigns").reset_hunk, { desc = "Rest hunk" })
map("n", "<leader>ph", require("gitsigns").preview_hunk, { desc = "Preview hunk" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
