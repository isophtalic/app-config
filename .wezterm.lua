local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- =========================================================
-- 🧠 GENERAL
-- =========================================================
config.automatically_reload_config = true
config.check_for_updates = false
config.scrollback_lines = 10000

-- =========================================================
-- 🎨 APPEARANCE
-- =========================================================
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Cascadia Code",
  "Fira Code",
})

config.font_size = 12.5

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

-- =========================================================
-- ⚡ PERFORMANCE
-- =========================================================
config.max_fps = 120
config.front_end = "WebGpu" -- đổi "OpenGL" nếu GPU yếu

-- =========================================================
-- 🪟 WINDOW LAYOUT
-- =========================================================
config.initial_cols = 120
config.initial_rows = 32

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- =========================================================
-- 🪟 DEFAULT SHELL (WINDOWS)
-- =========================================================
-- Option 1: PowerShell 7 (khuyến nghị)
-- config.default_prog = { "pwsh.exe" }

-- Option 2: CMD (nếu cần)
-- config.default_prog = { "cmd.exe" }

-- Option 3: WSL2 (Ubuntu)
-- config.default_prog = { "wsl.exe" }

-- =========================================================
-- 🪟 DEFAULT SHELL (Linux)
-- =========================================================
config.default_prog = { "/bin/zsh", "-l" }

-- Nếu dùng Bash:
-- config.default_prog = { "/bin/bash", "-l" }

-- =========================================================
-- ⌨️ KEYBIND (tmux-like + Windows friendly)
-- =========================================================

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- SPLIT PANES
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  -- PANE NAVIGATION (vim style)
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection "Down",
  },

  -- CLOSE PANE
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- TABS
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },

  -- FULLSCREEN
  {
    key = "f",
    mods = "LEADER",
    action = wezterm.action.ToggleFullScreen,
  },

  -- FONT SIZE
  {
    key = "=",
    mods = "CTRL",
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = "-",
    mods = "CTRL",
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = "0",
    mods = "CTRL",
    action = wezterm.action.ResetFontSize,
  },
}

-- =========================================================
-- 🔥 OPTIONAL: GPU backend tuning
-- =========================================================
-- config.enable_wayland = false (không cần trên Windows)

return config
