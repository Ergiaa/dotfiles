local M = {}

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

local function darken(hex, amount)
  local r, g, b = hex_to_rgb(hex)
  return rgb_to_hex(r * (1 - amount), g * (1 - amount), b * (1 - amount))
end

local function lighten(hex, amount)
  local r, g, b = hex_to_rgb(hex)
  return rgb_to_hex(r + (255 - r) * amount, g + (255 - g) * amount, b + (255 - b) * amount)
end

local function blend(hex1, hex2, ratio)
  local r1, g1, b1 = hex_to_rgb(hex1)
  local r2, g2, b2 = hex_to_rgb(hex2)
  return rgb_to_hex(r1 * (1 - ratio) + r2 * ratio, g1 * (1 - ratio) + g2 * ratio, b1 * (1 - ratio) + b2 * ratio)
end

local function parse_omarchy_theme()
  local theme_file = vim.fn.expand "~/.config/omarchy/current/theme/colors.toml"
  local colors = {}

  local file = io.open(theme_file, "r")
  if not file then
    vim.notify("Omarchy theme file not found: " .. theme_file, vim.log.levels.WARN)
    return nil
  end

  for line in file:lines() do
    local key, value = line:match "^(%w+)%s*=%s*\"([^\"]+)\""
    if key and value then
      colors[key] = value
    end
  end

  file:close()

  if not colors.background or not colors.foreground then
    vim.notify("Invalid Omarchy theme file", vim.log.levels.ERROR)
    return nil
  end

  return colors
end

local function generate_theme(colors)
  local theme = {
    base_16 = {
      base00 = colors.background,
      base01 = colors.color0,
      base02 = colors.color8,
      base03 = blend(colors.color0, colors.color8, 0.5),
      base04 = colors.foreground,
      base05 = lighten(colors.foreground, 0.1),
      base06 = lighten(colors.foreground, 0.2),
      base07 = colors.color15,
      base08 = colors.color1,
      base09 = colors.color3,
      base0A = colors.color2,
      base0B = colors.color2,
      base0C = colors.color6,
      base0D = colors.color4,
      base0E = colors.color5,
      base0F = colors.color14 or colors.color6,
    },
    base_30 = {
      white = colors.foreground,
      darker_black = darken(colors.background, 0.1),
      black = colors.background,
      black2 = lighten(colors.background, 0.05),
      one_bg = lighten(colors.background, 0.1),
      one_bg2 = lighten(colors.background, 0.15),
      one_bg3 = lighten(colors.background, 0.2),
      grey = lighten(colors.background, 0.25),
      grey_fg = lighten(colors.background, 0.3),
      grey_fg2 = lighten(colors.background, 0.35),
      light_grey = lighten(colors.background, 0.4),
      red = colors.color1,
      baby_pink = lighten(colors.color1, 0.2),
      pink = lighten(colors.color1, 0.1),
      line = blend(colors.background, colors.color8, 0.3),
      green = colors.color2,
      vibrant_green = lighten(colors.color2, 0.2),
      blue = colors.color4,
      nord_blue = colors.accent or colors.color4,
      yellow = colors.color3,
      sun = lighten(colors.color3, 0.2),
      purple = colors.color5,
      dark_purple = darken(colors.color5, 0.2),
      teal = colors.color6,
      orange = colors.color3,
      cyan = colors.color6,
      statusline_bg = darken(colors.background, 0.05),
      lightbg = lighten(colors.background, 0.1),
      pmenu_bg = colors.color2,
      folder_bg = colors.color4,
    },
    polish_hl = {
      treesitter = {
        ["@punctuation.bracket"] = { fg = colors.foreground },
        ["@punctuation.delimiter"] = { fg = colors.foreground },
      },
    },
    type = "dark",
  }

  return theme
end

function M.load()
  local colors = parse_omarchy_theme()
  if not colors then
    return require("base46.themes.nord")
  end

  local theme = generate_theme(colors)
  theme = require("base46").override_theme(theme, "omarchy")

  return theme
end

return M.load()
