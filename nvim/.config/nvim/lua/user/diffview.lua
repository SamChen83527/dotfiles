local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

local actions = diffview.actions

diffview.setup {
  diff_binaries = false,
  use_icons = true,
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
  view = {
    default = {
      layout = "diff2_horizontal",
    },
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,
    }
  },
  default_args = {
    DiffviewOpen = {"--untracked-files=no"},
    DiffviewFileHistory = { "--base=LOCAL" },
  }
}
