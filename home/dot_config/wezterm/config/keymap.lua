local wezterm = require("wezterm")
local act = wezterm.action

local M = {
  leader = { key = "Space", mods = "CTRL" },
  disable_default_key_bindings = true,
}

M.keys = {
  { key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

  -- { key = "d", mods = "CTRL", action = act.ScrollByPage(0.5) },
  -- { key = "u", mods = "CTRL", action = act.ScrollByPage(-0.5) },

  -- Tab
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "X", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "[", mods = "LEADER", action = act.MoveTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.MoveTabRelative(1) },

  -- Pane
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  {
    key = "_",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Down", size = { Percent = 30 } }),
  },
  { key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  { key = " ", mods = "LEADER", action = act.TogglePaneZoomState },

  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  { key = "K", mods = "LEADER", action = act.RotatePanes("Clockwise") },
  { key = "J", mods = "LEADER", action = act.RotatePanes("CounterClockwise") },

  { key = "s", mods = "LEADER", action = act.QuickSelect },
  { key = "/", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "?", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "m", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },

  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = act.ActivateTab(8) },

  -- which pane
  { key = "w", mods = "LEADER", action = act.PaneSelect },

  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
      until_unknown = true,
      replace_current = true,
    }),
  },
}

M.key_tables = {
  resize_pane = {
    { key = "LeftArrow", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "DownArrow", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "UpArrow", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "RightArrow", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "q", action = "PopKeyTable" },
    { key = "Escape", action = "PopKeyTable" },
  },
}

return M
